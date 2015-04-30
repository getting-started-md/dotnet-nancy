public class ServerModule : Nancy.NancyModule
{
    public ServerModule()
    {
        Get["/"] = _ => "Hello World!";
    }
}