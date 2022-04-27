
unit EditENEstimateItemStatusHistoryFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENEstimateItemStatusHistoryController ;

type
  TfrmENEstimateItemStatusHistoryFilterEdit = class(TDialogForm)

    lblIsLast : TLabel;
    edtIsLast: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENEstimateItemStatusHistory: THTTPRIO;

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
  frmENEstimateItemStatusHistoryFilterEdit: TfrmENEstimateItemStatusHistoryFilterEdit;
  ENEstimateItemStatusHistoryFilterObj: ENEstimateItemStatusHistoryFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENEstimateItemStatusHistoryController  ;
}
{$R *.dfm}



procedure TfrmENEstimateItemStatusHistoryFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENEstimateItemStatusHistoryObj.isLast <> Low(Integer) ) then
       edtIsLast.Text := IntToStr(ENEstimateItemStatusHistoryObj.isLast)
    else
       edtIsLast.Text := '';



      if ENEstimateItemStatusHistoryObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENEstimateItemStatusHistoryObj.dateEdit.Year,ENEstimateItemStatusHistoryObj.dateEdit.Month,ENEstimateItemStatusHistoryObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  


  end;

}

end;



procedure TfrmENEstimateItemStatusHistoryFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENEstimateItemStatusHistory: ENEstimateItemStatusHistoryControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtIsLast.Text <> '' ) then
       ENEstimateItemStatusHistoryFilterObj.isLast := StrToInt(edtIsLast.Text)
     else
       ENEstimateItemStatusHistoryFilterObj.isLast := Low(Integer) ;




     if edtdateEdit.checked then
     begin 
       if ENEstimateItemStatusHistoryFilterObj.dateEdit = nil then
          ENEstimateItemStatusHistoryFilterObj.dateEdit := TXSDateTime.Create;
       ENEstimateItemStatusHistoryFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENEstimateItemStatusHistoryFilterObj.dateEdit := nil;




  end;
end;




end.