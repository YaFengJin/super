package com.example.demo.controller.xx;

import com.example.demo.entity.Arrangemanage;
import com.example.demo.entity.Checksurface;
import com.example.demo.service.xx.CheckService;
import com.example.demo.service.xx.XxService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/xx")
public class CheckController {
    @Autowired
    private CheckService service;

    @Autowired
    private XxService xxService;

    /*查询考勤*/
    @RequestMapping("/xxChecksurfaceSelect")
    public Map xxChecksurfaceSelect(int sid,String month,
                                    @RequestParam(required=false,defaultValue="1") int page,
                                    @RequestParam(required=false,defaultValue="10") int limit) throws Throwable {
        Map<String,Object> map = new HashMap<String, Object>();
        Page<Map<String,Object>> pages = PageHelper.startPage(page,limit);
        List datas = service.xxChecksurfaceSelect(sid,month);
        map.put("code",0);
        map.put("msg","");
        map.put("count",pages.getTotal());
        map.put("data",datas);
        return map;
    }
    /*统计考勤*/
    @RequestMapping("/gotime1")
    public Map gotime1(Integer userId,String begin,String end){
        int sid = userId;
        Map map1 = service.gotime1(userId,sid,begin,end);
        return map1;
    }
    /*考勤统计*/
    @RequestMapping("/xxkaoqintongji")
    public Map xxkaoqintongji(String name,
                              @RequestParam(required=false,defaultValue="0")int uid,
                              @RequestParam(required=false,defaultValue="1") int page,
                              @RequestParam(required=false,defaultValue="10") int limit){
        Map map = new HashMap();
        Page<Map<String,Object>> pages = PageHelper.startPage(page,limit);
        List<Map<String, Object>> map1 =  service.xxkaoqintongji(uid,name);
        map.put("code",0);
        map.put("msg","");
        map.put("count",pages.getTotal());
        map.put("data",map1);
        return map;
    }
    /*考勤明细*/
    @RequestMapping("/xxmingxi")
    public Map xxmingxi(Checksurface checksurface){
        Map map = new HashMap();
        List<Map<String, Object>> list =  service.xxmingxi(checksurface);
        map.put("list",list);
        return map;
    }
    /*导入exc*/
    @RequestMapping("/getAllByExcel")
    public Map upload(@RequestParam("file1")MultipartFile file) {
        Map<String,Object> map = new HashMap<String, Object>();
        int a = 0;
        if (file==null) {
            map.put("message","file不能为空");
            return map;
        }
        try {
            List<Arrangemanage> all = xxService.xxArrangemanageselect1();//查询启用的排班
            if (all.size()>0) {
                HSSFWorkbook workbook = new HSSFWorkbook(new POIFSFileSystem(file.getInputStream()));
                //有多少个sheet
                int sheets = workbook.getNumberOfSheets();
                HSSFSheet sheet = workbook.getSheetAt(0);
                //获取多少行
                int rows = sheet.getPhysicalNumberOfRows();
                Checksurface answer = null;
                //遍历每一行，注意：第 0 行为标题
                for (int j = 1; j < rows + 1; j++) {
                    Checksurface checksurface = new Checksurface();
                    //获得第 j 行
                    HSSFRow row = sheet.getRow(j);
                    row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
                    row.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
                    row.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
                    row.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
                    row.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
                    row.getCell(6).setCellType(Cell.CELL_TYPE_STRING);
                    row.getCell(7).setCellType(Cell.CELL_TYPE_STRING);
                    row.getCell(8).setCellType(Cell.CELL_TYPE_STRING);
                    row.getCell(9).setCellType(Cell.CELL_TYPE_STRING);

                    String userId = row.getCell(1).getStringCellValue();
                    String checkName = row.getCell(2).getStringCellValue();
                    String checkTime = row.getCell(3).getStringCellValue();
                    String checkRemark = row.getCell(4).getStringCellValue();
                    String checkNumber = row.getCell(5).getStringCellValue();
                    String goTimeOne = row.getCell(6).getStringCellValue();
                    String downTimeOne = row.getCell(7).getStringCellValue();
                    String goTimeTwo = row.getCell(8).getStringCellValue();
                    String downTimeTwo = row.getCell(9).getStringCellValue();
                    System.out.println(goTimeTwo);

                    SimpleDateFormat simpleDateFormat = (SimpleDateFormat) DateFormat.getDateInstance();

                    simpleDateFormat.applyPattern("yyyy-MM-dd");
                    Date checkTime1 = new Date(simpleDateFormat.parse(checkTime).getTime());

                    simpleDateFormat.applyPattern("HH:mm:ss");
                    Time goTimeOne1 = new Time(simpleDateFormat.parse(goTimeOne).getTime());
                    Time downTimeOne1 = new Time(simpleDateFormat.parse(downTimeOne).getTime());
                    Time goTimeTwo1 = new Time(simpleDateFormat.parse(goTimeTwo).getTime());
                    Time downTimeTwo1 = new Time(simpleDateFormat.parse(downTimeTwo).getTime());


                    checksurface.setUserId(Integer.parseInt(userId));
                    checksurface.setCheckName(checkName);
                    checksurface.setCheckTime(checkTime1);
                    checksurface.setCheckRemark(checkRemark);
                    checksurface.setCheckNumber(checkNumber);
                    checksurface.setGoTimeOne(goTimeOne1);
                    checksurface.setDownTimeOne(downTimeOne1);
                    checksurface.setGoTimeTwo(goTimeTwo1);
                    checksurface.setDownTimeTwo(downTimeTwo1);
                    a = service.xxChecksurfaceInsert(checksurface);
                }
            }else {
                a = -1;
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if (a>0){
            map.put("message","添加成功");
        }else if (a==-1){
            map.put("message","请填写排班");
        }else {
            map.put("message","添加失败");
        }
        return map;
    }

    public static boolean isExcel2003(String filePath)
    {
        return filePath.matches("^.+\\.(?i)(xls)$");
    }

    public static boolean isExcel2007(String filePath)
    {
        return filePath.matches("^.+\\.(?i)(xlsx)$");
    }


}
