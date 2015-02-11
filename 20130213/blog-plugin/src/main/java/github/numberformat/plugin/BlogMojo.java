package github.numberformat.plugin;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;

/**
 * This is a simple plug-in that generates a blog page from a velocity
 * template. This allows developers to create very simple project documentation
 * pages for their projects. Developers would typically create a blog entry by
 * copying and pasting the HTML directly into the blog site.
 * 
 * @goal generate
 */
public class BlogMojo extends AbstractMojo {
	/**
	 * @parameter default-value="${basedir}"
	 * @required
	 * @readonly
	 */
	private File basedir;

	/**
	 * Represents the date first published.
	 * 
	 * @parameter default-value="https://github.com/numberformat"
	 * @required
	 * @readonly
	 */
	private String gitUrl;
	
	
	public void execute() throws MojoExecutionException {
		
		final File templateDir = basedir;
		final File targetBlog = new File(basedir, "target/blog");

		if(new File(templateDir, "src/blog/wordpress.vm").canRead()) {
			if(!targetBlog.exists()) {
				targetBlog.mkdirs();
			} else if(!targetBlog.isDirectory()) {
				throw new MojoExecutionException("Must be a directory: " + targetBlog.getAbsolutePath());
			}
	
	        VelocityEngine ve = new VelocityEngine();
	        ve.setProperty("file.resource.loader.path", templateDir.getAbsolutePath());
	        ve.init();
        
	        Template t = ve.getTemplate( "src/blog/wordpress.vm" );
	        VelocityContext context = new VelocityContext();
	        context.put("blog_header", getHeader());
	        context.put("blog_footer", getFooter());
	        context.put("blog_git_url", gitUrl);
	        
	        FileWriter writer = null;
			try {
				writer = new FileWriter(new File(targetBlog, "wordpress.html"));
		        t.merge( context, writer );				
			} catch (IOException e) {
				throw new MojoExecutionException(e.getMessage());
			} finally {
				try{writer.close();}catch(Exception e){}				
			}
		}
	}


	private Object getFooter() {
		return "<div style=\"font-size:13px;border:1px solid gray; " +
				"padding:5px;line-height:120%\">Full downloadable source for " +
				"this page is <a href=\""+gitUrl+"\">available here</a>. " +
				"</div>";
	}

	private Object getHeader() {
		return "<div style=\"font-size:13px;border:1px solid gray; " +
				"padding:5px;line-height:120%\">Full downloadable source for " +
				"this page is <a href=\""+gitUrl+"\">available here</a>. " +
				"Corrections and enhancements are welcome, fork, change and push " +
				"back to GitHub.</div>";
	}
}
