/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.73
 * Generated at: 2017-07-12 19:21:54 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class CambiaContrasena_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out = _jspx_page_context.pushBody();
      out.write("<script src=\"js/CambiaContrasena.js\"></script>\t\t\n");
      out.write("\n");
      out.write("        <section style=\"clear: both\">\n");
      out.write("            <form action=\"CambiaContrasena\" method=\"post\" name=\"form1\" id=\"form1\">\n");
      out.write("                <div style=\"text-align: center; margin-bottom: 30px;\">    \n");
      out.write("\n");
      out.write("\t\t\t\t\t<div class=\"ui-widget\" id=\"message\">\n");
      out.write("\t\t\t\t\t\t<div class=\"ui-state-highlight ui-corner-all msg\" >\n");
      out.write("\t\t\t\t\t\t\t<p><span class=\"ui-icon ui-icon-info\" style=\"float: left; margin-right: .3em;\"></span>\n");
      out.write("\t\t\t\t\t\t\t<strong id=\"innerMessage\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${message}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</strong></p>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("                    <h3>Cambiar Contraseña</h3>\n");
      out.write("\n");
      out.write("\t                     <table style=\"width:40%25; text-align: center\" class=\"list1 green\">\n");
      out.write("                            <tr>\n");
      out.write("                                <th width=\"30%25\" class=\"right\">Clave</th>\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"60%25\" class=\"left\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${usu.cveUsu}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</td>    \t\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <th width=\"30%25\" class=\"right\">Nombre</th>\n");
      out.write("                                <td width=\"60%25\" class=\"left\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${usu.nomUsu}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <th width=\"30%25\" class=\"right\">Apellido Padrino</th>\n");
      out.write("                                <td width=\"60%25\" class=\"left\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${usu.nomPatUsu}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <th width=\"30%25\" class=\"right\">Apellido Madrino</th>\n");
      out.write("                                <td width=\"60%25\" class=\"left\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${usu.nomMatUsu}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</td>\n");
      out.write("                            </tr>\n");
      out.write("                           <tr>\n");
      out.write("                                <th width=\"30%25\" class=\"right\">Contraseña</th>\n");
      out.write("                                <td width=\"60%25\" class=\"left\">\n");
      out.write("                                \t<input type=\"text\" size=\"20\" value=\"\" name=\"pwsUsu\" id=\"pwsUsu\"/>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                    </table>\n");
      out.write("\t                <div style=\"text-align: center; margin-top: 10px\">\n");
      out.write("                        <input type=\"button\" value=\"Modificar\" name=\"Modificar\" class=\"botonimagenchico\" onclick=\"funcValidacion()\"/>\n");
      out.write("\t                </div> \n");
      out.write("                </div>\n");
      out.write("                <input type=\"hidden\" name=\"hidCveUsu\" id=\"hidCveUsu\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${usu.cveUsu}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\"/>\n");
      out.write("            </form>\n");
      out.write("        </section>");
      java.lang.String _jspx_temp0 = ((javax.servlet.jsp.tagext.BodyContent)out).getString();
      out = _jspx_page_context.popBody();
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/jsp/Master.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("title", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${title}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false), request.getCharacterEncoding()) + "&" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("content", request.getCharacterEncoding())+ "=" + _jspx_temp0, out, false);
      out.write('\n');
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
