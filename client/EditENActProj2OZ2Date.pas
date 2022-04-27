
unit EditENActProj2OZ2Date;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActProj2OZ2DateController ;

type
  TfrmENActProj2OZ2DateEdit = class(TDialogForm)
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;

  btnOk: TButton;
  btnCancel: TButton;
    HTTPRIOENActProj2OZ2Date: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENActProj2OZ2DateEdit: TfrmENActProj2OZ2DateEdit;
  ENActProj2OZ2DateObj: ENActProj2OZ2Date;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActProj2OZ2DateController  ;
}
{$R *.dfm}



procedure TfrmENActProj2OZ2DateEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      // edtCode.Text := IntToStr(ENActProj2OZ2DateObj.code);
      if ENActProj2OZ2DateObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENActProj2OZ2DateObj.dateGen.Year,ENActProj2OZ2DateObj.dateGen.Month,ENActProj2OZ2DateObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;


  end;
end;



procedure TfrmENActProj2OZ2DateEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActProj2OZ2Date: ENActProj2OZ2DateControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([   edtDateGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENActProj2OZ2Date := HTTPRIOENActProj2OZ2Date as ENActProj2OZ2DateControllerSoapPort;


     if edtdateGen.checked then
     begin 
       if ENActProj2OZ2DateObj.dateGen = nil then
          ENActProj2OZ2DateObj.dateGen := TXSDate.Create;
       ENActProj2OZ2DateObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENActProj2OZ2DateObj.dateGen := nil;

    if DialogState = dsInsert then
    begin
      ENActProj2OZ2DateObj.code:=low(Integer);
      TempENActProj2OZ2Date.add(ENActProj2OZ2DateObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENActProj2OZ2Date.save(ENActProj2OZ2DateObj);
    end;
  end;
end;


end.