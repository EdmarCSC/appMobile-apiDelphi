unit Controller.ControllerUser;

interface

  procedure Registry;

implementation

uses
    Horse,
    Services.SeviceUser,
    DataSet.Serialize,
    System.JSON,
    Data.DB;

procedure DoUserListAll(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServiceUser;
begin
  LService := TServiceUser.Create(Nil);
  try
    Res.Send(LService.listAll.ToJSONArray);
  finally
    LService.Free;
  end;
end;

procedure DoGet(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LId : String;
  LService : TServiceUser;
begin
  LService := TServiceUser.Create(nil);
  try
    LId := Req.Params.Items['id'];
    if LService.GetById(LId).IsEmpty then
      Res.Send( EHorseException.;
      raise EHorseException.Create(THTTPStatus.NotFound, 'Not Found');
    Res.Send(LService.QryUser.ToJSONObject());
  finally
    LService.Free;
  end;

end;

procedure DoUserPost(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServiceUser;
  LData: TJSONObject;
begin
  LService := TServiceUser.Create(nil);
  try
    LData := Req.Body<TJSONObject>;
    if LService.Append(LData) then
      Res.Send(LService.AppendUser.ToJSONObject);
  finally
    LService.Free;
  end;
end;

procedure DoUsersDelete(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LId : String;
  LService : TServiceUser;
begin
  LService := TServiceUser.Create(nil);
  try
    LId := Req.Params.Items['id'];
    if LService.GetById(LId).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Not Found');
    if LService.Delete then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/users', DoUserListAll);
  THorse.Get('/users/:id', DoGet);
  THorse.Post('/users', DoUserPost);
  THorse.Delete('/users/:id', DoUsersDelete);
end;
end.
