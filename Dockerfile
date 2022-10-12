ARG version=ltsc2022
FROM mcr.microsoft.com/windows/servercore:$version

#RUN Install-PackageProvider -Name chocolatey -RequiredVersion 2.8.5.130 -Force;  Install-Package -Name webdeploy -RequiredVersion 3.6.0 -Force;
	
ENV chocolateyUseWindowsCompression false

RUN powershell -Command iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
	
#RUN choco install curl --yes
# RUN choco install bazelisk --yes
RUN choco install bazel --yes
RUN bazel version
#RUN powershell -Command ls

# docker build -t mde-bazel-win:5.3.1 .
# docker login
# docker push mde-bazel-win:5.3.1
# https://github.com/bazelbuild/bazelisk/releases/download/v1.14.0/bazelisk-windows-amd64.exe

# RUN Invoke-WebRequest -UseBasicParsing  -Uri https://github.com/bazelbuild/bazelisk/releases/download/v1.14.0/bazelisk-windows-amd64.exe -OutFile 'bazel.exe'; 