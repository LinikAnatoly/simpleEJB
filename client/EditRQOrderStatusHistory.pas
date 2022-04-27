
unit EditRQOrderStatusHistory;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderStatusHistoryController ;

type
  TfrmRQOrderStatusHistoryEdit = class(TDialogForm)

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;


  HTTPRIORQOrderStatusHistory: THTTPRIO;

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
  frmRQOrderStatusHistoryEdit: TfrmRQOrderStatusHistoryEdit;
  RQOrderStatusHistoryObj: RQOrderStatusHistory;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrderStatusHistoryController  ;
}
{$R *.dfm}



procedure TfrmRQOrderStatusHistoryEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      if RQOrderStatusHistoryObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(RQOrderStatusHistoryObj.dateGen.Year,RQOrderStatusHistoryObj.dateGen.Month,RQOrderStatusHistoryObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
    edtUserGen.Text := RQOrderStatusHistoryObj.userGen; 


  end;
end;



procedure TfrmRQOrderStatusHistoryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderStatusHistory: RQOrderStatusHistoryControllerSoapPort;
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
    TempRQOrderStatusHistory := HTTPRIORQOrderStatusHistory as RQOrderStatusHistoryControllerSoapPort;


     if edtdateGen.checked then
     begin 
       if RQOrderStatusHistoryObj.dateGen = nil then
          RQOrderStatusHistoryObj.dateGen := TXSDate.Create;
       RQOrderStatusHistoryObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       RQOrderStatusHistoryObj.dateGen := nil;

     RQOrderStatusHistoryObj.userGen := edtUserGen.Text; 

    if DialogState = dsInsert then
    begin
      RQOrderStatusHistoryObj.code:=low(Integer);
      TempRQOrderStatusHistory.add(RQOrderStatusHistoryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQOrderStatusHistory.save(RQOrderStatusHistoryObj);
    end;
  end;
end;


end.