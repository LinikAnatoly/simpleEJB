
unit EditFINExecutor;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINExecutorController ;

type
  TfrmFINExecutorEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblFinCode : TLabel;
    edtFinCode: TEdit;
    lblFinTypeName : TLabel;
    edtFinTypeName: TEdit;
    lblFinTypeCode : TLabel;
    edtFinTypeCode: TEdit;
    lblFinKindName : TLabel;
    edtFinKindName: TEdit;
    lblFinKindCode : TLabel;
    edtFinKindCode: TEdit;
    lblFinCehName : TLabel;
    edtFinCehName: TEdit;
    lblFinCehCode : TLabel;
    edtFinCehCode: TEdit;


  HTTPRIOFINExecutor: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmFINExecutorEdit: TfrmFINExecutorEdit;
  FINExecutorObj: FINExecutor;

implementation


{uses  
    EnergyproController, EnergyproController2, FINExecutorController  ;
}
{$R *.dfm}



procedure TfrmFINExecutorEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtFinCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := FINExecutorObj.name; 
    if ( FINExecutorObj.finCode <> Low(Integer) ) then
       edtFinCode.Text := IntToStr(FINExecutorObj.finCode)
    else
       edtFinCode.Text := '';
    edtFinTypeName.Text := FINExecutorObj.finTypeName; 
    if ( FINExecutorObj.finTypeCode <> Low(Integer) ) then
       edtFinTypeCode.Text := IntToStr(FINExecutorObj.finTypeCode)
    else
       edtFinTypeCode.Text := '';
    edtFinKindName.Text := FINExecutorObj.finKindName; 
    if ( FINExecutorObj.finKindCode <> Low(Integer) ) then
       edtFinKindCode.Text := IntToStr(FINExecutorObj.finKindCode)
    else
       edtFinKindCode.Text := '';
    edtFinCehName.Text := FINExecutorObj.finCehName; 
    if ( FINExecutorObj.finCehCode <> Low(Integer) ) then
       edtFinCehCode.Text := IntToStr(FINExecutorObj.finCehCode)
    else
       edtFinCehCode.Text := '';


  end;
end;



procedure TfrmFINExecutorEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINExecutor: FINExecutorControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtFinCode
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempFINExecutor := HTTPRIOFINExecutor as FINExecutorControllerSoapPort;


     FINExecutorObj.name := edtName.Text; 

     if ( edtFinCode.Text <> '' ) then
       FINExecutorObj.finCode := StrToInt(edtFinCode.Text)
     else
       FINExecutorObj.finCode := Low(Integer) ;

     FINExecutorObj.finTypeName := edtFinTypeName.Text; 

     if ( edtFinTypeCode.Text <> '' ) then
       FINExecutorObj.finTypeCode := StrToInt(edtFinTypeCode.Text)
     else
       FINExecutorObj.finTypeCode := Low(Integer) ;

     FINExecutorObj.finKindName := edtFinKindName.Text; 

     if ( edtFinKindCode.Text <> '' ) then
       FINExecutorObj.finKindCode := StrToInt(edtFinKindCode.Text)
     else
       FINExecutorObj.finKindCode := Low(Integer) ;

     FINExecutorObj.finCehName := edtFinCehName.Text; 

     if ( edtFinCehCode.Text <> '' ) then
       FINExecutorObj.finCehCode := StrToInt(edtFinCehCode.Text)
     else
       FINExecutorObj.finCehCode := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      FINExecutorObj.code:=low(Integer);
      TempFINExecutor.add(FINExecutorObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempFINExecutor.save(FINExecutorObj);
    end;
  end;
end;


end.