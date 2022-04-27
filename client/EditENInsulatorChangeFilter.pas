
unit EditENInsulatorChangeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENInsulatorChangeController ;

type
  TfrmENInsulatorChangeFilterEdit = class(TDialogForm)

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
  

  HTTPRIOENInsulatorChange: THTTPRIO;

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
  frmENInsulatorChangeFilterEdit: TfrmENInsulatorChangeFilterEdit;
  ENInsulatorChangeFilterObj: ENInsulatorChangeFilter;

implementation

uses
  ShowEquipChangeWorker
  ,EquipChangeWorkerController
;

{uses  
    EnergyproController, EnergyproController2, ENInsulatorChangeController  ;
}
{$R *.dfm}



procedure TfrmENInsulatorChangeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENInsulatorChangeObj.name; 



      if ENInsulatorChangeObj.installDate <> nil then
      begin
        edtInstallDate.DateTime:=EncodeDate(ENInsulatorChangeObj.installDate.Year,ENInsulatorChangeObj.installDate.Month,ENInsulatorChangeObj.installDate.Day);
        edtInstallDate.checked := true;
      end
      else
      begin
        edtInstallDate.DateTime:=SysUtils.Date;
        edtInstallDate.checked := false;
      end;



      if ENInsulatorChangeObj.uninstallDate <> nil then
      begin
        edtUninstallDate.DateTime:=EncodeDate(ENInsulatorChangeObj.uninstallDate.Year,ENInsulatorChangeObj.uninstallDate.Month,ENInsulatorChangeObj.uninstallDate.Day);
        edtUninstallDate.checked := true;
      end
      else
      begin
        edtUninstallDate.DateTime:=SysUtils.Date;
        edtUninstallDate.checked := false;
      end;



    edtWorkOrderNumber.Text := ENInsulatorChangeObj.workOrderNumber; 



      if ENInsulatorChangeObj.dateWorkOrder <> nil then
      begin
        edtDateWorkOrder.DateTime:=EncodeDate(ENInsulatorChangeObj.dateWorkOrder.Year,ENInsulatorChangeObj.dateWorkOrder.Month,ENInsulatorChangeObj.dateWorkOrder.Day);
        edtDateWorkOrder.checked := true;
      end
      else
      begin
        edtDateWorkOrder.DateTime:=SysUtils.Date;
        edtDateWorkOrder.checked := false;
      end;



    edtActNumberGen.Text := ENInsulatorChangeObj.actNumberGen; 



      if ENInsulatorChangeObj.actDateGen <> nil then
      begin
        edtActDateGen.DateTime:=EncodeDate(ENInsulatorChangeObj.actDateGen.Year,ENInsulatorChangeObj.actDateGen.Month,ENInsulatorChangeObj.actDateGen.Day);
        edtActDateGen.checked := true;
      end
      else
      begin
        edtActDateGen.DateTime:=SysUtils.Date;
        edtActDateGen.checked := false;
      end;



    edtWorkerEquipChange.Text := ENInsulatorChangeObj.workerEquipChange; 


  end;

}

end;



procedure TfrmENInsulatorChangeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENInsulatorChange: ENInsulatorChangeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENInsulatorChangeFilterObj.name := edtName.Text; 



     if edtinstallDate.checked then
     begin 
       if ENInsulatorChangeFilterObj.installDate = nil then
          ENInsulatorChangeFilterObj.installDate := TXSDate.Create;
       ENInsulatorChangeFilterObj.installDate.XSToNative(GetXSDate(edtinstallDate.DateTime));
     end
     else
       ENInsulatorChangeFilterObj.installDate := nil;



     if edtuninstallDate.checked then
     begin 
       if ENInsulatorChangeFilterObj.uninstallDate = nil then
          ENInsulatorChangeFilterObj.uninstallDate := TXSDate.Create;
       ENInsulatorChangeFilterObj.uninstallDate.XSToNative(GetXSDate(edtuninstallDate.DateTime));
     end
     else
       ENInsulatorChangeFilterObj.uninstallDate := nil;



     ENInsulatorChangeFilterObj.workOrderNumber := edtWorkOrderNumber.Text; 



     if edtdateWorkOrder.checked then
     begin 
       if ENInsulatorChangeFilterObj.dateWorkOrder = nil then
          ENInsulatorChangeFilterObj.dateWorkOrder := TXSDate.Create;
       ENInsulatorChangeFilterObj.dateWorkOrder.XSToNative(GetXSDate(edtdateWorkOrder.DateTime));
     end
     else
       ENInsulatorChangeFilterObj.dateWorkOrder := nil;



     ENInsulatorChangeFilterObj.actNumberGen := edtActNumberGen.Text; 



     if edtactDateGen.checked then
     begin 
       if ENInsulatorChangeFilterObj.actDateGen = nil then
          ENInsulatorChangeFilterObj.actDateGen := TXSDate.Create;
       ENInsulatorChangeFilterObj.actDateGen.XSToNative(GetXSDate(edtactDateGen.DateTime));
     end
     else
       ENInsulatorChangeFilterObj.actDateGen := nil;



     ENInsulatorChangeFilterObj.workerEquipChange := edtWorkerEquipChange.Text; 




  end;
end;

procedure TfrmENInsulatorChangeFilterEdit.spbEquipChangeWorkerWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENInsulatorChangeFilterObj.worker = nil then ENInsulatorChangeFilterObj.worker := EquipChangeWorker.Create();
               ENInsulatorChangeFilterObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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