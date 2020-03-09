package util;
import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.StudentInfoDao;
import jxl.Sheet;
import jxl.Workbook;
import mysql.MysqlUtil;
import pojo.StuInfo;

public class ExcelToDb {
    public static int excelToDb() {
    	int i = -1 ;
        //得到表格中所有的数据
        List< StuInfo > listExcel=ExcelToDb.getAllByExcel("/www/server/tomcat/webapps/dor/stuInfo.xls");
        /*//得到数据库表中所有的数据
        List<StuEntity> listDb=StuService.getAllByDb();*/
        
        StudentInfoDao db=new StudentInfoDao();
        
        for (StuInfo stuEntity : listExcel) {
            String id=stuEntity.getStu_id();
            if (!isExist(id)) {
            
                String sql="insert into stu_info values(?,?,?,?,?,?,?,?)";
                String[] str=new String[]{id,stuEntity.getPassword(),stuEntity.getName(),stuEntity.getSex(),stuEntity.getDepartment(),stuEntity.getDor_id(),stuEntity.getStu_phone(),stuEntity.getStu_class()};
                i =MysqlUtil.AddU(sql, str);
            }else {
          
                String sql="update stu_info set password=?,dor_id=?,name=?,sex=?,department=?,stu_class=?,stu_phone=? where stu_id=?";
                String[] str=new String[]{stuEntity.getPassword(),stuEntity.getName(),stuEntity.getSex(),stuEntity.getDepartment(),stuEntity.getDor_id(),stuEntity.getStu_phone(),stuEntity.getStu_class(),id};
                i = MysqlUtil.AddU(sql, str);
            }
        }
        return i ;
    }
    public static List<StuInfo> getAllByExcel(String file){
        List<StuInfo> list=new ArrayList<StuInfo>();
        try {
            Workbook rwb=Workbook.getWorkbook(new File(file));
            Sheet rs=rwb.getSheet("stuInfo");//或者rwb.getSheet(0)
            int clos=rs.getColumns();//得到所有的列
            int rows=rs.getRows();//得到所有的行
            
            System.out.println("clos:"+clos+" rows:"+(rows-1));
            for (int i = 1; i < rows; i++) {
                for (int j = 0; j < clos; j++) {
                    //第一个是列数，第二个是行数
                    String stu_id=rs.getCell(j++, i).getContents();//默认最左边编号也算一列 所以这里得j++
                    String password=rs.getCell(j++, i).getContents();
                    String dor_id=rs.getCell(j++, i).getContents();
                    String name=rs.getCell(j++, i).getContents();
                    String sex=rs.getCell(j++, i).getContents();
                    String department=rs.getCell(j++, i).getContents();
                    String stu_class=rs.getCell(j++, i).getContents();
                    String stu_phone=rs.getCell(j++, i).getContents();
             
                    
                    System.out.println("学号:"+stu_id+"  密码:"+password+"  宿舍号:"+dor_id+"  姓名:"+name+"  性别:"+sex+"  所在系:"+department+"  班级:"+stu_class+"  联系方式:"+stu_phone);
                    list.add(new StuInfo(stu_id,password,dor_id,name,sex,department,stu_class,stu_phone
                			));
                }
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        return list;
        
    }
    
    /**
     * 通过Id判断是否存在
     * @param id
     * @return
     */
    public static boolean isExist(String id){
        try {
        	StudentInfoDao db=new StudentInfoDao();
            ResultSet rs=db.Search("select * from stu_info where stu_id=?", new String[]{id+""});
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }
    
}
