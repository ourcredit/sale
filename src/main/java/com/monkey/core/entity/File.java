package com.monkey.core.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhaohejing123
 * @since 2018-06-07
 */
@TableName("sale_file")
public class File extends Model<File> {

    private static final long serialVersionUID = 1L;

    /**
     * key
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;
    /**
     * 文件名
     */
    private String name;
    /**
     * 大小
     */
    private Long size;
    /**
     * 后缀
     */
    private String ext;
    /**
     * 路径
     */
    private String path;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
    }

    public String getExt() {
        return ext;
    }

    public void setExt(String ext) {
        this.ext = ext;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "File{" +
        "id=" + id +
        ", name=" + name +
        ", size=" + size +
        ", ext=" + ext +
        ", path=" + path +
        "}";
    }
}
