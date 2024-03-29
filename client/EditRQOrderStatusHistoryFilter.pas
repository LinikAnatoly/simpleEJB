
unit EditRQOrderStatusHistoryFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderStatusHistoryController ;

type
  TfrmRQOrderStatusHistoryFilterEdit = class(TDialogForm)

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
  frmRQOrderStatusHistoryFilterEdit: TfrmRQOrderStatusHistoryFilterEdit;
  RQOrderStatusHistoryFilterObj: RQOrderStatusHistoryFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrderStatusHistoryController  ;
}
{$R *.dfm}



procedure TfrmRQOrderStatusHistoryFilterEdit.FormShow(Sender: TObject);

begin

{ ���� ���� �� ������ ...

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

}

end;



procedure TfrmRQOrderStatusHistoryFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderStatusHistory: RQOrderStatusHistoryControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if RQOrderStatusHistoryFilterObj.dateGen = nil then
        RQOrderStatusHistoryFilterObj.dateGen := TXSDate.Create;
      RQOrderStatusHistoryFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));




     RQOrderStatusHistoryFilterObj.userGen := edtUserGen.Text; 




  end;
end;




end.