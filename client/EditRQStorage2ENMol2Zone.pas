
unit EditRQStorage2ENMol2Zone;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQStorage2ENMol2ZoneController ;

type
  TfrmRQStorage2ENMol2ZoneEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIORQStorage2ENMol2Zone: THTTPRIO;

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
  frmRQStorage2ENMol2ZoneEdit: TfrmRQStorage2ENMol2ZoneEdit;
  RQStorage2ENMol2ZoneObj: RQStorage2ENMol2Zone;

implementation


{uses  
    EnergyproController, EnergyproController2, RQStorage2ENMol2ZoneController  ;
}
{$R *.dfm}



procedure TfrmRQStorage2ENMol2ZoneEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQStorage2ENMol2ZoneObj.code);
    edtUserGen.Text := RQStorage2ENMol2ZoneObj.userGen; 
      if RQStorage2ENMol2ZoneObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQStorage2ENMol2ZoneObj.dateEdit.Year,RQStorage2ENMol2ZoneObj.dateEdit.Month,RQStorage2ENMol2ZoneObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;
end;



procedure TfrmRQStorage2ENMol2ZoneEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQStorage2ENMol2Zone: RQStorage2ENMol2ZoneControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQStorage2ENMol2Zone := HTTPRIORQStorage2ENMol2Zone as RQStorage2ENMol2ZoneControllerSoapPort;


     RQStorage2ENMol2ZoneObj.userGen := edtUserGen.Text; 

     if edtdateEdit.checked then
     begin 
       if RQStorage2ENMol2ZoneObj.dateEdit = nil then
          RQStorage2ENMol2ZoneObj.dateEdit := TXSDateTime.Create;
       RQStorage2ENMol2ZoneObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQStorage2ENMol2ZoneObj.dateEdit := nil;	   

    if DialogState = dsInsert then
    begin
      RQStorage2ENMol2ZoneObj.code:=low(Integer);
      TempRQStorage2ENMol2Zone.add(RQStorage2ENMol2ZoneObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQStorage2ENMol2Zone.save(RQStorage2ENMol2ZoneObj);
    end;
  end;
end;


end.