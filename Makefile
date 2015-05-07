DEPENDENCIES=-r:packages/Nancy.1.2.0/lib/net40/Nancy.dll

all: clean sample template_sample

sample:
	mcs $(DEPENDENCIES) -t:library SampleModule.cs -out:bin/SampleModule.dll

template_sample:
	mcs $(DEPENDENCIES) -t:library TemplateSampleModule.cs -out:bin/TemplateSampleModule.dll

package_rebuild: package_clean package_install

package_clean:
	find . -path ./packages -type d -exec rm -r {} \;


package_install:
	nuget restore packages/packages.config -PackagesDirectory packages

clean:
	rm -rf bin/*
	ln -s ../packages/Nancy.Viewengines.Razor.1.2.0/lib/net40/Nancy.ViewEngines.Razor.dll bin/Nancy.ViewEngines.Razor.dll
	ln -s ../packages/Microsoft.AspNet.Razor.3.2.3/lib/net45/System.Web.Razor.dll bin/System.Web.Razor.dll
	ln -s ../packages/Nancy.Hosting.Aspnet.1.2.0/lib/net40/Nancy.Hosting.Aspnet.dll bin/Nancy.Hosting.Aspnet.dll
	ln -s ../packages/Nancy.1.2.0/lib/net40/Nancy.dll bin/Nancy.dll

server:
	xsp4