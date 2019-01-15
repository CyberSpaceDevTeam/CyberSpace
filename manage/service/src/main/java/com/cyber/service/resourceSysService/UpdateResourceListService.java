package com.cyber.service.resourceSysService;

import com.cyber.mapper.resourceSysMapper.ResourceListMapper;
import com.cyber.pojo.User;
import com.cyber.pojo.resourceSysPojo.PicUploadResult;
import com.cyber.pojo.resourceSysPojo.ResourceList;
import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class UpdateResourceListService {
    @Autowired
    private ResourceListMapper resourceListMapper;

    public PicUploadResult updateResourceList(MultipartFile file, ResourceList resourceList, Integer id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User sessionuser = (User) session.getAttribute("user");
        PicUploadResult result = new PicUploadResult();
        if (file.isEmpty()) {
            resourceList.setResourcelistId(id);
            User user = new User();
            user.setUserId(sessionuser.getUserId());
            resourceList.setUser(user);
            resourceListMapper.updateResourceList(resourceList);
            return result;
        }
        //文件名的后缀判断合法
        String fileOldName = file.getOriginalFilename();
        //后缀.jsp
        String extName = fileOldName.substring(fileOldName.lastIndexOf("."));
        String regex = "^.(jpg|png|gif)$";
        if (!extName.matches(regex)) {
            result.setError(1);
            return result;
        }
        try {
            //利用Java的 buffereImage 对象保存流，
            //如果是图片数据，有宽高，非图片数据，没有宽高数据
            BufferedImage bufferedImage = ImageIO.read(file.getInputStream());
            //执行成功没有异常，说明数据有高的数据
            result.setHeight(bufferedImage.getHeight() + "");
            result.setWidth(bufferedImage.getWidth() + "");
            //生成公用路径 dir /image/2018/10/21
            String dir = "/image/resourcelist" + new SimpleDateFormat("yyyy/MM/dd").format(new Date()) + "/";
            //磁盘路径
            String path = "D:\\apache-tomcat-8.0.23\\webapps" + dir;
            //url路径
            String urlPath = "http://localhost:8080" + dir;
            //fiel存盘,生成磁盘的文件夹结构
            File _dir = new File(path);
            //文件夹结构不存在磁盘需要输出
            if (!_dir.exists()) {
                _dir.mkdirs();
            }
            //重命名文件名称
            String fileName = System.currentTimeMillis() + ""
                    + RandomUtils.nextInt(100, 999) + extName;

            //拼接url访问地址
            //http://image.jt.com/image/2018/10/21/128937612973.jpg
            result.setUrl(urlPath + fileName);
            //输出文件到目录
            //d:/JT-UPLOAD/image/2018/10/21/128937612973.jpg
            file.transferTo(new File(path + fileName));
            User user = new User();
            user.setUserId(sessionuser.getUserId());
            resourceList.setResourcelistId(id);
            resourceList.setUser(user);
            resourceList.setResourcelistPicture(urlPath + fileName);
            resourceListMapper.updateResourceList(resourceList);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            result.setError(1);
            return result;

        }
    }

}
