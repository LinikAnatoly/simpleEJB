
unit EditENMeasurDevChangeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMeasurDevChangeController ;

type
  TfrmENMeasurDevChangeFilterEdit = class(TDialogForm)

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
  

  HTTPRIOENMeasurDevChange: THTTPRIO;

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
  frmENMeasurDevChangeFilterEdit: TfrmENMeasurDevChangeFilterEdit;
  ENMeasurDevChangeFilterObj: ENMeasurDevChangeFilter;

implementation

uses
  ShowEquipChangeWorker
  ,EquipChangeWorkerController
;

{uses  
    EnergyproController, EnergyproController2, ENMeasurDevChangeController  ;
}
{$R *.dfm}



procedure TfrmENMeasurDevChangeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENMeasurDevChangeObj.name; 



      if ENMeasurDevChangeObj.installDate <> nil then
      begin
        edtInstallDate.DateTime:=EncodeDate(ENMeasurDevChangeObj.installDate.Year,ENMeasurDevChangeObj.installDate.Month,ENMeasurDevChangeObj.installDate.Day);
        edtInstallDate.checked := true;
      end
      else
      begin
        edtInstallDate.DateTime:=SysUtils.Date;
        edtInstallDate.checked := false;
      end;



      if ENMeasurDevChangeObj.uninstallDate <> nil then
      begin
        edtUninstallDate.DateTime:=EncodeDate(ENMeasurDevChangeObj.uninstallDate.Year,ENMeasurDevChangeObj.uninstallDate.Month,ENMeasurDevChangeObj.uninstallDate.Day);
        edtUninstallDate.checked := true;
      end
      else
      begin
        edtUninstallDate.DateTime:=SysUtils.Date;
        edtUninstallDate.checked := false;
      end;



    edtWorkOrderNumber.Text := ENMeasurDevChangeObj.workOrderNumber; 



      if ENMeasurDevChangeObj.dateWorkOrder <> nil then
      begin
        edtDateWorkOrder.DateTime:=EncodeDate(ENMeasurDevChangeObj.dateWorkOrder.Year,ENMeasurDevChangeObj.dateWorkOrder.Month,ENMeasurDevChangeObj.dateWorkOrder.Day);
        edtDateWorkOrder.checked := true;
      end
      else
      begin
        edtDateWorkOrder.DateTime:=SysUtils.Date;
        edtDateWorkOrder.checked := false;
      end;



    edtActNumberGen.Text := ENMeasurDevChangeObj.actNumberGen; 



      if ENMeasurDevChangeObj.actDateGen <> nil then
      begin
        edtActDateGen.DateTime:=EncodeDate(ENMeasurDevChangeObj.actDateGen.Year,ENMeasurDevChangeObj.actDateGen.Month,ENMeasurDevChangeObj.actDateGen.Day);
        edtActDateGen.checked := true;
      end
      else
      begin
        edtActDateGen.DateTime:=SysUtils.Date;
        edtActDateGen.checked := false;
      end;



    edtWorkerEquipChange.Text := ENMeasurDevChangeObj.workerEquipChange; 


  end;

}

end;



procedure TfrmENMeasurDevChangeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMeasurDevChange: ENMeasurDevChangeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENMeasurDevChangeFilterObj.name := edtName.Text; 



     if edtinstallDate.checked then
     begin 
       if ENMeasurDevChangeFilterObj.installDate = nil then
          ENMeasurDevChangeFilterObj.installDate := TXSDate.Create;
       ENMeasurDevChangeFilterObj.installDate.XSToNative(GetXSDate(edtinstallDate.DateTime));
     end
     else
       ENMeasurDevChangeFilterObj.installDate := nil;



     if edtuninstallDate.checked then
     begin 
       if ENMeasurDevChangeFilterObj.uninstallDate = nil then
          ENMeasurDevChangeFilterObj.uninstallDate := TXSDate.Create;
       ENMeasurDevChangeFilterObj.uninstallDate.XSToNative(GetXSDate(edtuninstallDate.DateTime));
     end
     else
       ENMeasurDevChangeFilterObj.uninstallDate := nil;



     ENMeasurDevChangeFilterObj.workOrderNumber := edtWorkOrderNumber.Text; 



     if edtdateWorkOrder.checked then
     begin 
       if ENMeasurDevChangeFilterObj.dateWorkOrder = nil then
          ENMeasurDevChangeFilterObj.dateWorkOrder := TXSDate.Create;
       ENMeasurDevChangeFilterObj.dateWorkOrder.XSToNative(GetXSDate(edtdateWorkOrder.DateTime));
     end
     else
       ENMeasurDevChangeFilterObj.dateWorkOrder := nil;



     ENMeasurDevChangeFilterObj.actNumberGen := edtActNumberGen.Text; 



     if edtactDateGen.checked then
     begin 
       if ENMeasurDevChangeFilterObj.actDateGen = nil then
          ENMeasurDevChangeFilterObj.actDateGen := TXSDate.Create;
       ENMeasurDevChangeFilterObj.actDateGen.XSToNative(GetXSDate(edtactDateGen.DateTime));
     end
     else
       ENMeasurDevChangeFilterObj.actDateGen := nil;



     ENMeasurDevChangeFilterObj.workerEquipChange := edtWorkerEquipChange.Text; 




  end;
end;

procedure TfrmENMeasurDevChangeFilterEdit.spbEquipChangeWorkerWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENMeasurDevChangeFilterObj.worker = nil then ENMeasurDevChangeFilterObj.worker := EquipChangeWorker.Create();
               ENMeasurDevChangeFilterObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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