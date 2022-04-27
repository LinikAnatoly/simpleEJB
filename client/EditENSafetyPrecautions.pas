
unit EditENSafetyPrecautions;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSafetyPrecautionsController ;

type
  TfrmENSafetyPrecautionsEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;

  lblENLockTypeLockTypeName : TLabel;
  edtENLockTypeLockTypeName : TEdit;
  spbENLockTypeLockType : TSpeedButton;
  
  lblENFencingFencingName : TLabel;
  edtENFencingFencingName : TEdit;
  spbENFencingFencing : TSpeedButton;
  

  HTTPRIOENSafetyPrecautions: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENLockTypeLockTypeClick(Sender : TObject);
  procedure spbENFencingFencingClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSafetyPrecautionsEdit: TfrmENSafetyPrecautionsEdit;
  ENSafetyPrecautionsObj: ENSafetyPrecautions;

implementation

uses
  ShowENLockType
  ,ENLockTypeController
  ,ShowENFencing
  ,ENFencingController
;

{uses  
    EnergyproController, EnergyproController2, ENSafetyPrecautionsController  ;
}
{$R *.dfm}



procedure TfrmENSafetyPrecautionsEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENLockTypeLockTypeName
      ,spbENLockTypeLockType
      ,edtENFencingFencingName
      ,spbENFencingFencing
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSafetyPrecautionsObj.code);
    edtName.Text := ENSafetyPrecautionsObj.name; 

    edtENLockTypeLockTypeName.Text := ENSafetyPrecautionsObj.lockType.name;
    edtENFencingFencingName.Text := ENSafetyPrecautionsObj.fencing.name;

  end;
end;



procedure TfrmENSafetyPrecautionsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSafetyPrecautions: ENSafetyPrecautionsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSafetyPrecautions := HTTPRIOENSafetyPrecautions as ENSafetyPrecautionsControllerSoapPort;


     ENSafetyPrecautionsObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENSafetyPrecautionsObj.code:=low(Integer);
      TempENSafetyPrecautions.add(ENSafetyPrecautionsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSafetyPrecautions.save(ENSafetyPrecautionsObj);
    end;
  end;
end;


procedure TfrmENSafetyPrecautionsEdit.spbENLockTypeLockTypeClick(Sender : TObject);
var 
   frmENLockTypeShow: TfrmENLockTypeShow;
begin
   frmENLockTypeShow:=TfrmENLockTypeShow.Create(Application,fmNormal);
   try
      with frmENLockTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSafetyPrecautionsObj.lockType = nil then ENSafetyPrecautionsObj.lockType := ENLockType.Create();
               ENSafetyPrecautionsObj.lockType.code := StrToInt(GetReturnValue(sgENLockType,0));
               edtENLockTypeLockTypeName.Text:=GetReturnValue(sgENLockType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENLockTypeShow.Free;
   end;
end;



procedure TfrmENSafetyPrecautionsEdit.spbENFencingFencingClick(Sender : TObject);
var 
   frmENFencingShow: TfrmENFencingShow;
begin
   frmENFencingShow:=TfrmENFencingShow.Create(Application,fmNormal);
   try
      with frmENFencingShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSafetyPrecautionsObj.fencing = nil then ENSafetyPrecautionsObj.fencing := ENFencing.Create();
               ENSafetyPrecautionsObj.fencing.code := StrToInt(GetReturnValue(sgENFencing,0));
               edtENFencingFencingName.Text:=GetReturnValue(sgENFencing,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENFencingShow.Free;
   end;
end;



end.