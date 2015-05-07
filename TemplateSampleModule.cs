public class TemplateSampleModule : Nancy.NancyModule
{
    public TemplateSampleModule()
    {
        Nancy.StaticConfiguration.DisableErrorTraces = false;
        Get["/hi"] = _ => "Hello";
        Get["/hello"] = Hello;
    }

    private dynamic Hello(dynamic parameters)
    {
        return View["hello_world"];
    }
}