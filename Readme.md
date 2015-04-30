## Install mono mdk.

Download and run installer from

`http://www.mono-project.com/download/#download-mac`

or if you have brew cask installed

```
brew cask install mono-mdk
brew cask install mono-mre
```


## Install Nancy

`nuget install nancy`

## Simple app

```
public class SampleModule : Nancy.NancyModule
{
    public SampleModule()
    {
        Get["/"] = _ => "Hello World!";
    }
}
```

## Web.config

```
<system.web>
  <compilation debug="true" targetFramework="4.0" />
  <httpHandlers>
    <add verb="*" type="Nancy.Hosting.Aspnet.NancyHttpRequestHandler" path="*"/>
  </httpHandlers>
</system.web>

<system.webServer>
  <modules runAllManagedModulesForAllRequests="true"/>
  <validation validateIntegratedModeConfiguration="false"/>
  <handlers>
    <add name="Nancy" verb="*" type="Nancy.Hosting.Aspnet.NancyHttpRequestHandler" path="*"/>
  </handlers>
</system.webServer>
```

## Packages

```
<?xml version="1.0" encoding="utf-8"?>
<packages>
  <package id="Nancy" version="1.2.0" />
  <package id="Nancy.Hosting.Aspnet" version="1.2.0" />
</packages>
```

`nuget restore packages/packages.config -PackagesDirectory packages`


## Building

`mkdir -p bin`


`mcs -r:packages/Nancy.1.2.0/lib/net40/Nancy.dll -t:library ServerModule.cs -out:bin/ServerModule.dll`

## Link Assemblies

```
ln -s ../packages/Nancy.Hosting.Aspnet.1.2.0/lib/net40/Nancy.Hosting.Aspnet.dll bin/Nancy.Hosting.Aspnet.dll
ln -s ../packages/Nancy.1.2.0/lib/net40/Nancy.dll bin/Nancy.dll
```


## Run it

`xsp4`

Visit http://localhost:8080

