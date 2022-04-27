
unit EditENAccumulatorsHistoryFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAccumulatorsHistoryController ;

type
  TfrmENAccumulatorsHistoryFilterEdit = class(TDialogForm)

    lblInstallDate : TLabel;
    edtInstallDate: TDateTimePicker;
    lblUninstallDate : TLabel;
    edtUninstallDate: TDateTimePicker;
    lblDistance : TLabel;
    edtDistance: TEdit;

    lblReplacementReason : TLabel;
    edtReplacementReason: TEdit;



  HTTPRIOENAccumulatorsHistory: THTTPRIO;

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
  frmENAccumulatorsHistoryFilterEdit: TfrmENAccumulatorsHistoryFilterEdit;
  ENAccumulatorsHistoryFilterObj: ENAccumulatorsHistoryFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAccumulatorsHistoryController  ;
}
{$R *.dfm}



procedure TfrmENAccumulatorsHistoryFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if ENAccumulatorsHistoryObj.installDate <> nil then
      begin
        edtInstallDate.DateTime:=EncodeDate(ENAccumulatorsHistoryObj.installDate.Year,ENAccumulatorsHistoryObj.installDate.Month,ENAccumulatorsHistoryObj.installDate.Day);
        edtInstallDate.checked := true;
      end
      else
      begin
        edtInstallDate.DateTime:=SysUtils.Date;
        edtInstallDate.checked := false;
      end;



      if ENAccumulatorsHistoryObj.uninstallDate <> nil then
      begin
        edtUninstallDate.DateTime:=EncodeDate(ENAccumulatorsHistoryObj.uninstallDate.Year,ENAccumulatorsHistoryObj.uninstallDate.Month,ENAccumulatorsHistoryObj.uninstallDate.Day);
        edtUninstallDate.checked := true;
      end
      else
      begin
        edtUninstallDate.DateTime:=SysUtils.Date;
        edtUninstallDate.checked := false;
      end;



    if ( ENAccumulatorsHistoryObj.distance <> nil ) then
       edtDistance.Text := ENAccumulatorsHistoryObj.distance.decimalString
    else
       edtDistance.Text := ''; 



    edtReplacementReason.Text := ENAccumulatorsHistoryObj.replacementReason; 


  end;

}

end;



procedure TfrmENAccumulatorsHistoryFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAccumulatorsHistory: ENAccumulatorsHistoryControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtinstallDate.checked then
     begin 
       if ENAccumulatorsHistoryFilterObj.installDate = nil then
          ENAccumulatorsHistoryFilterObj.installDate := TXSDate.Create;
       ENAccumulatorsHistoryFilterObj.installDate.XSToNative(GetXSDate(edtinstallDate.DateTime));
     end
     else
       ENAccumulatorsHistoryFilterObj.installDate := nil;



     if edtuninstallDate.checked then
     begin 
       if ENAccumulatorsHistoryFilterObj.uninstallDate = nil then
          ENAccumulatorsHistoryFilterObj.uninstallDate := TXSDate.Create;
       ENAccumulatorsHistoryFilterObj.uninstallDate.XSToNative(GetXSDate(edtuninstallDate.DateTime));
     end
     else
       ENAccumulatorsHistoryFilterObj.uninstallDate := nil;



     if (ENAccumulatorsHistoryFilterObj.distance = nil ) then
       ENAccumulatorsHistoryFilterObj.distance := TXSDecimal.Create;
     if edtDistance.Text <> '' then
       ENAccumulatorsHistoryFilterObj.distance.decimalString := edtDistance.Text 
     else
       ENAccumulatorsHistoryFilterObj.distance := nil;




     ENAccumulatorsHistoryFilterObj.replacementReason := edtReplacementReason.Text; 




  end;
end;




end.