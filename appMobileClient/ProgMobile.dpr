program ProgMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  appMobile.Login in 'src\view\appMobile.Login.pas' {frmLogin},
  Style.Login in 'src\style\Style.Login.pas',
  appMobile.Menu in 'src\view\appMobile.Menu.pas' {frmMenu},
  service.users in 'src\service\service.users.pas' {DMService : TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TDMService, DMService);
  Application.Run;
end.
