unit Services.SeviceUser;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.ConsoleUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, System.JSON, DataSet.Serialize;

type
  TServiceUser = class(TDataModule)
    ConnectionUser: TFDConnection;
    QryUser: TFDQuery;
    AppendUser: TFDQuery;
    AppendUserNOME_USER: TStringField;
    AppendUserLOGIN_USER: TStringField;
    AppendUserSENHA_USER: TStringField;
    AppendUserCOD_USER: TIntegerField;
    QryUserCOD_USER: TIntegerField;
    QryUserNOME_USER: TStringField;
    QryUserLOGIN_USER: TStringField;
    QryUserSENHA_USER: TStringField;
  public
    { Public declarations }
    function listAll: TFDQuery;
    function GetById(const AId: string): TFDQuery;
    function Append(const AJSON: TJSONObject): Boolean;
    function Delete: Boolean;
  end;


implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

function TServiceUser.listAll: TFDQuery;
begin
  QryUser.Open();
  Result := QryUser;
end;

function TServiceUser.GetById(const AId: string): TFDQuery;
begin
  QryUser.SQL.Add('where cod_user = :id');
  QryUser.ParamByName('id').AsInteger := AId.ToInteger;
  QryUser.Open();

  Result := QryUser;
end;

function TServiceUser.Append(const AJSON: TJSONObject): Boolean;
begin
  AppendUser.SQL.Add('where 1 <> 1 ');
  AppendUser.Open();
  AppendUser.LoadFromJSON(AJSON, False);


  Result := AppendUser.ApplyUpdates(0) = 0;
end;

function TServiceUser.Delete: Boolean;
begin
  QryUser.Delete;

  Result := QryUser.ApplyUpdates(0) = 0;
end;


end.
