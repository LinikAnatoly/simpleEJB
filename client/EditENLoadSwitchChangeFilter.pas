
unit EditENLoadSwitchChangeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLoadSwitchChangeController ;

type
  TfrmENLoadSwitchChangeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblInstallDate : TLabel;
    edtInstallDate: TDateTimePicker;
    lblUninstallDate : TLabel;
    edtUninstallDate: TDateTimePicker;
    lblWorkOrderNumber : TLabel;
    edtWorkOrderNumber: TEdit;

    lblDateWorkOrder : TLabel;
    edtDateWorkOrder: TDateTimePicker;
    lblActNumberGen : TLabel;
    edtActNumberGen: TEdit;

    lblActDateGen : TLabel;
    edtActDateGen: TDateTimePicker;
    lblWorkerEquipChange : TLabel;
    edtWorkerEquipChange: TEdit;


  lblEquipChangeWorkerWorkerName : TLabel;
  edtEquipChangeWorkerWorkerName : TEdit;
  spbEquipChangeWorkerWorker : TSpeedButton;
  

  HTTPRIOENLoadSwitchChange: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbEquipChangeWorkerWorkerClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENLoadSwitchChangeFilterEdit: TfrmENLoadSwitchChangeFilterEdit;
  ENLoadSwitchChangeFilterObj: ENLoadSwitchChangeFilter;

implementation

uses
  ShowEquipChangeWorker
  ,EquipChangeWorkerController
;

{uses  
    EnergyproController, EnergyproController2, ENLoadSwitchChangeController  ;
}
{$R *.dfm}



procedure TfrmENLoadSwitchChangeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtActNumberGen
      ,edtActDateGen
      ,edtWorkerEquipChange
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENLoadSwitchChangeObj.name; 



      if ENLoadSwitchChangeObj.installDate <> nil then
      begin
        edtInstallDate.DateTime:=EncodeDate(ENLoadSwitchChangeObj.installDate.Year,ENLoadSwitchChangeObj.installDate.Month,ENLoadSwitchChangeObj.installDate.Day);
        edtInstallDate.checked := true;
      end
      else
      begin
        edtInstallDate.DateTime:=SysUtils.Date;
        edtInstallDate.checked := false;
      end;



      if ENLoadSwitchChangeObj.uninstallDate <> nil then
      begin
        edtUninstallDate.DateTime:=EncodeDate(ENLoadSwitchChangeObj.uninstallDate.Year,ENLoadSwitchChangeObj.uninstallDate.Month,ENLoadSwitchChangeObj.uninstallDate.Day);
        edtUninstallDate.checked := true;
      end
      else
      begin
        edtUninstallDate.DateTime:=SysUtils.Date;
        edtUninstallDate.checked := false;
      end;



    edtWorkOrderNumber.Text := ENLoadSwitchChangeObj.workOrderNumber; 



      if ENLoadSwitchChangeObj.dateWorkOrder <> nil then
      begin
        edtDateWorkOrder.DateTime:=EncodeDate(ENLoadSwitchChangeObj.dateWorkOrder.Year,ENLoadSwitchChangeObj.dateWorkOrder.Month,ENLoadSwitchChangeObj.dateWorkOrder.Day);
        edtDateWorkOrder.checked := true;
      end
      else
      begin
        edtDateWorkOrder.DateTime:=SysUtils.Date;
        edtDateWorkOrder.checked := false;
      end;



    edtActNumberGen.Text := ENLoadSwitchChangeObj.actNumberGen; 



      if ENLoadSwitchChangeObj.actDateGen <> nil then
      begin
        edtActDateGen.DateTime:=EncodeDate(ENLoadSwitchChangeObj.actDateGen.Year,ENLoadSwitchChangeObj.actDateGen.Month,ENLoadSwitchChangeObj.actDateGen.Day);
        edtActDateGen.checked := true;
      end
      else
      begin
        edtActDateGen.DateTime:=SysUtils.Date;
        edtActDateGen.checked := false;
      end;



    edtWorkerEquipChange.Text := ENLoadSwitchChangeObj.workerEquipChange; 


  end;

}

end;



procedure TfrmENLoadSwitchChangeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLoadSwitchChange: ENLoadSwitchChangeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENLoadSwitchChangeFilterObj.name := edtName.Text; 



     if edtinstallDate.checked then
     begin 
       if ENLoadSwitchChangeFilterObj.installDate = nil then
          ENLoadSwitchChangeFilterObj.installDate := TXSDate.Create;
       ENLoadSwitchChangeFilterObj.installDate.XSToNative(GetXSDate(edtinstallDate.DateTime));
     end
     else
       ENLoadSwitchChangeFilterObj.installDate := nil;



     if edtuninstallDate.checked then
     begin 
       if ENLoadSwitchChangeFilterObj.uninstallDate = nil then
          ENLoadSwitchChangeFilterObj.uninstallDate := TXSDate.Create;
       ENLoadSwitchChangeFilterObj.uninstallDate.XSToNative(GetXSDate(edtuninstallDate.DateTime));
     end
     else
       ENLoadSwitchChangeFilterObj.uninstallDate := nil;



     ENLoadSwitchChangeFilterObj.workOrderNumber := edtWorkOrderNumber.Text; 



     if edtdateWorkOrder.checked then
     begin 
       if ENLoadSwitchChangeFilterObj.dateWorkOrder = nil then
          ENLoadSwitchChangeFilterObj.dateWorkOrder := TXSDate.Create;
       ENLoadSwitchChangeFilterObj.dateWorkOrder.XSToNative(GetXSDate(edtdateWorkOrder.DateTime));
     end
     else
       ENLoadSwitchChangeFilterObj.dateWorkOrder := nil;



     ENLoadSwitchChangeFilterObj.actNumberGen := edtActNumberGen.Text; 



     if edtactDateGen.checked then
     begin 
       if ENLoadSwitchChangeFilterObj.actDateGen = nil then
          ENLoadSwitchChangeFilterObj.actDateGen := TXSDate.Create;
       ENLoadSwitchChangeFilterObj.actDateGen.XSToNative(GetXSDate(edtactDateGen.DateTime));
     end
     else
       ENLoadSwitchChangeFilterObj.actDateGen := nil;



     ENLoadSwitchChangeFilterObj.workerEquipChange := edtWorkerEquipChange.Text; 




  end;
end;

procedure TfrmENLoadSwitchChangeFilterEdit.spbEquipChangeWorkerWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLoadSwitchChangeFilterObj.worker = nil then ENLoadSwitchChangeFilterObj.worker := EquipChangeWorker.Create();
               ENLoadSwitchChangeFilterObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
               edtEquipChangeWorkerWorkerName.Text:=GetReturnValue(sgEquipChangeWorker,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEquipChangeWorkerShow.Free;
   end;
end;





end.