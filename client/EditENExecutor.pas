
unit EditENExecutor;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENExecutorController ;

type
  TfrmENExecutorEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblExecutorFio : TLabel;
    edtExecutorFio: TEdit;
    lblExecutorPhone : TLabel;
    edtExecutorPhone: TEdit;
    lblExecutorEmail : TLabel;
    edtExecutorEmail: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;


  HTTPRIOENExecutor: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    Label2: TLabel;
    edtENSheet4SOTypeName: TEdit;
    btnENSheet4SOType: TSpeedButton;
    btnENSheet4SOTypeClear: TSpeedButton;
    HTTPRIOENSheets4SOType: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnENSheet4SOTypeClick(Sender: TObject);
    procedure btnENSheet4SOTypeClearClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENExecutorEdit: TfrmENExecutorEdit;
  ENExecutorObj: ENExecutor;

implementation

uses ShowENSheets4SOType, ENSheets4SOTypeController, ENConsts;



{$R *.dfm}



procedure TfrmENExecutorEdit.FormShow(Sender: TObject);
var
  TempENSheets4SOType: ENSheets4SOTypeControllerSoapPort;
  ENSheets4SOTypeObj: ENSheets4SOType;
begin
  DisableControls([edtCode, edtENSheet4SOTypeName]);
  SetIntStyle([edtCode]);

  if (DialogState = dsInsert) then
    HideControls([lblCode, edtCode]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtExecutorFio
      ,edtExecutorPhone
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENExecutorObj.code);
    edtExecutorFio.Text := ENExecutorObj.executorFio;
    edtExecutorPhone.Text := ENExecutorObj.executorPhone; 
    edtExecutorEmail.Text := ENExecutorObj.executorEmail; 
    edtCommentGen.Text := ENExecutorObj.commentGen;

    if ENExecutorObj.sheetTypeRef <> nil then
      if ENExecutorObj.sheetTypeRef.code <> LOW_INT then
      begin
        TempENSheets4SOType := HTTPRIOENSheets4SOType as ENSheets4SOTypeControllerSoapPort;
        ENSheets4SOTypeObj := TempENSheets4SOType.getObject(ENExecutorObj.sheetTypeRef.code);
        if ENSheets4SOTypeObj <> nil then
          edtENSheet4SOTypeName.Text := ENSheets4SOTypeObj.name;
      end;
  end;
end;



procedure TfrmENExecutorEdit.btnENSheet4SOTypeClearClick(Sender: TObject);
begin
  ENExecutorObj.sheetTypeRef := nil;
  edtENSheet4SOTypeName.Text := '';
end;

procedure TfrmENExecutorEdit.btnENSheet4SOTypeClick(Sender: TObject);
var
  frmENSheets4SOTypeShow: TfrmENSheets4SOTypeShow;
begin
  frmENSheets4SOTypeShow := TfrmENSheets4SOTypeShow.Create(Application, fmNormal);
  try
    with frmENSheets4SOTypeShow do
      if ShowModal = mrOk then
      begin
        try
          edtENSheet4SOTypeName.Text := GetReturnValue(sgENSheets4SOType, 1);
          ENExecutorObj.sheetTypeRef := ENSheets4SOTypeRef.Create;
          ENExecutorObj.sheetTypeRef.code := StrToInt(GetReturnValue(sgENSheets4SOType, 0));
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENSheets4SOTypeShow.Free;
  end;
end;

procedure TfrmENExecutorEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENExecutor: ENExecutorControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtExecutorFio
      ,edtExecutorPhone
     ])  then
  begin
      Application.MessageBox(PChar('Порожні поля неприпустимі!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENExecutor := HTTPRIOENExecutor as ENExecutorControllerSoapPort;

     ENExecutorObj.executorFio := edtExecutorFio.Text; 
     ENExecutorObj.executorPhone := edtExecutorPhone.Text; 
     ENExecutorObj.executorEmail := edtExecutorEmail.Text; 
     ENExecutorObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENExecutorObj.code:=low(Integer);
      TempENExecutor.add(ENExecutorObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENExecutor.save(ENExecutorObj);
    end;
  end;
end;


end.