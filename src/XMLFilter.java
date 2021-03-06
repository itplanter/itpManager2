import java.io.File;

import javax.swing.filechooser.FileFilter;

public class XMLFilter extends FileFilter{
	  @Override
	public boolean accept(File f){
	    /* ディレクトリなら無条件で表示する */
	    if (f.isDirectory()){
	      return true;
	    }

	    /* 拡張子を取り出し、xmlだったら表示する */
	    String ext = getExtension(f);
	    if (ext != null){
	      if (ext.equals("xml") ){
	        return true;
	      }else{
	        return false;
	      }
	    }

	    return false;
	  }

	  @Override
	public String getDescription(){
	    return "XMLファイル";
	  }

	  /* 拡張子を取り出す */
	  private String getExtension(File f){
	    String ext = null;
	    String filename = f.getName();
	    int dotIndex = filename.lastIndexOf('.');

	    if ((dotIndex > 0) && (dotIndex < filename.length() - 1)){
	      ext = filename.substring(dotIndex + 1).toLowerCase();
	    }
	      
	    return ext;
	  }
	}