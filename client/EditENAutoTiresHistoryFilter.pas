
unit EditENAutoTiresHistoryFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAutoTiresHistoryController ;

type
  TfrmENAutoTiresHistoryFilterEdit = class(TDialogForm)

    lblInstallDate : TLabel;
    edtInstallDate: TDateTimePicker;
    lblUninstallDate : TLabel;
    edtUninstallDate: TDateTimePicker;
    lblDistance : TLabel;
    edtDistance: TEdit;

    lblReplacementReason : TLabel;
    edtReplacementReason: TEdit;



  HTTPRIOENAutoTiresHistory: THTTPRIO;

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
  frmENAutoTiresHistoryFilterEdit: TfrmENAutoTiresHistoryFilterEdit;
  ENAutoTiresHistoryFilterObj: ENAutoTiresHistoryFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAutoTiresHistoryController  ;
}
{$R *.dfm}



procedure TfrmENAutoTiresHistoryFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if ENAutoTiresHistoryObj.installDate <> nil then
      begin
        edtInstallDate.DateTime:=EncodeDate(ENAutoTiresHistoryObj.installDate.Year,ENAutoTiresHistoryObj.installDate.Month,ENAutoTiresHistoryObj.installDate.Day);
        edtInstallDate.checked := true;
      end
      else
      begin
        edtInstallDate.DateTime:=SysUtils.Date;
        edtInstallDate.checked := false;
      end;



      if ENAutoTiresHistoryObj.uninstallDate <> nil then
      begin
        edtUninstallDate.DateTime:=EncodeDate(ENAutoTiresHistoryObj.uninstallDate.Year,ENAutoTiresHistoryObj.uninstallDate.Month,ENAutoTiresHistoryObj.uninstallDate.Day);
        edtUninstallDate.checked := true;
      end
      else
      begin
        edtUninstallDate.DateTime:=SysUtils.Date;
        edtUninstallDate.checked := false;
      end;



    if ( ENAutoTiresHistoryObj.distance <> nil ) then
       edtDistance.Text := ENAutoTiresHistoryObj.distance.decimalString
    else
       edtDistance.Text := ''; 



    edtReplacementReason.Text := ENAutoTiresHistoryObj.replacementReason; 


  end;

}

end;



procedure TfrmENAutoTiresHistoryFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAutoTiresHistory: ENAutoTiresHistoryControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtinstallDate.checked then
     begin 
       if ENAutoTiresHistoryFilterObj.installDate = nil then
          ENAutoTiresHistoryFilterObj.installDate := TXSDate.Create;
       ENAutoTiresHistoryFilterObj.installDate.XSToNative(GetXSDate(edtinstallDate.DateTime));
     end
     else
       ENAutoTiresHistoryFilterObj.installDate := nil;



     if edtuninstallDate.checked then
     begin 
       if ENAutoTiresHistoryFilterObj.uninstallDate = nil then
          ENAutoTiresHistoryFilterObj.uninstallDate := TXSDate.Create;
       ENAutoTiresHistoryFilterObj.uninstallDate.XSToNative(GetXSDate(edtuninstallDate.DateTime));
     end
     else
       ENAutoTiresHistoryFilterObj.uninstallDate := nil;



     if (ENAutoTiresHistoryFilterObj.distance = nil ) then
       ENAutoTiresHistoryFilterObj.distance := TXSDecimal.Create;
     if edtDistance.Text <> '' then
       ENAutoTiresHistoryFilterObj.distance.decimalString := edtDistance.Text 
     else
       ENAutoTiresHistoryFilterObj.distance := nil;




     ENAutoTiresHistoryFilterObj.replacementReason := edtReplacementReason.Text; 




  end;
end;




end.