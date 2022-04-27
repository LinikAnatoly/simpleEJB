
unit EditENBusChangeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBusChangeController ;

type
  TfrmENBusChangeFilterEdit = class(TDialogForm)

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
  

  HTTPRIOENBusChange: THTTPRIO;

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
  frmENBusChangeFilterEdit: TfrmENBusChangeFilterEdit;
  ENBusChangeFilterObj: ENBusChangeFilter;

implementation

uses
  ShowEquipChangeWorker
  ,EquipChangeWorkerController
;

{uses  
    EnergyproController, EnergyproController2, ENBusChangeController  ;
}
{$R *.dfm}



procedure TfrmENBusChangeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENBusChangeObj.name; 



      if ENBusChangeObj.installDate <> nil then
      begin
        edtInstallDate.DateTime:=EncodeDate(ENBusChangeObj.installDate.Year,ENBusChangeObj.installDate.Month,ENBusChangeObj.installDate.Day);
        edtInstallDate.checked := true;
      end
      else
      begin
        edtInstallDate.DateTime:=SysUtils.Date;
        edtInstallDate.checked := false;
      end;



      if ENBusChangeObj.uninstallDate <> nil then
      begin
        edtUninstallDate.DateTime:=EncodeDate(ENBusChangeObj.uninstallDate.Year,ENBusChangeObj.uninstallDate.Month,ENBusChangeObj.uninstallDate.Day);
        edtUninstallDate.checked := true;
      end
      else
      begin
        edtUninstallDate.DateTime:=SysUtils.Date;
        edtUninstallDate.checked := false;
      end;



    edtWorkOrderNumber.Text := ENBusChangeObj.workOrderNumber; 



      if ENBusChangeObj.dateWorkOrder <> nil then
      begin
        edtDateWorkOrder.DateTime:=EncodeDate(ENBusChangeObj.dateWorkOrder.Year,ENBusChangeObj.dateWorkOrder.Month,ENBusChangeObj.dateWorkOrder.Day);
        edtDateWorkOrder.checked := true;
      end
      else
      begin
        edtDateWorkOrder.DateTime:=SysUtils.Date;
        edtDateWorkOrder.checked := false;
      end;



    edtActNumberGen.Text := ENBusChangeObj.actNumberGen; 



      if ENBusChangeObj.actDateGen <> nil then
      begin
        edtActDateGen.DateTime:=EncodeDate(ENBusChangeObj.actDateGen.Year,ENBusChangeObj.actDateGen.Month,ENBusChangeObj.actDateGen.Day);
        edtActDateGen.checked := true;
      end
      else
      begin
        edtActDateGen.DateTime:=SysUtils.Date;
        edtActDateGen.checked := false;
      end;



    edtWorkerEquipChange.Text := ENBusChangeObj.workerEquipChange; 


  end;

}

end;



procedure TfrmENBusChangeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBusChange: ENBusChangeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENBusChangeFilterObj.name := edtName.Text; 



     if edtinstallDate.checked then
     begin 
       if ENBusChangeFilterObj.installDate = nil then
          ENBusChangeFilterObj.installDate := TXSDate.Create;
       ENBusChangeFilterObj.installDate.XSToNative(GetXSDate(edtinstallDate.DateTime));
     end
     else
       ENBusChangeFilterObj.installDate := nil;



     if edtuninstallDate.checked then
     begin 
       if ENBusChangeFilterObj.uninstallDate = nil then
          ENBusChangeFilterObj.uninstallDate := TXSDate.Create;
       ENBusChangeFilterObj.uninstallDate.XSToNative(GetXSDate(edtuninstallDate.DateTime));
     end
     else
       ENBusChangeFilterObj.uninstallDate := nil;



     ENBusChangeFilterObj.workOrderNumber := edtWorkOrderNumber.Text; 



     if edtdateWorkOrder.checked then
     begin 
       if ENBusChangeFilterObj.dateWorkOrder = nil then
          ENBusChangeFilterObj.dateWorkOrder := TXSDate.Create;
       ENBusChangeFilterObj.dateWorkOrder.XSToNative(GetXSDate(edtdateWorkOrder.DateTime));
     end
     else
       ENBusChangeFilterObj.dateWorkOrder := nil;



     ENBusChangeFilterObj.actNumberGen := edtActNumberGen.Text; 



     if edtactDateGen.checked then
     begin 
       if ENBusChangeFilterObj.actDateGen = nil then
          ENBusChangeFilterObj.actDateGen := TXSDate.Create;
       ENBusChangeFilterObj.actDateGen.XSToNative(GetXSDate(edtactDateGen.DateTime));
     end
     else
       ENBusChangeFilterObj.actDateGen := nil;



     ENBusChangeFilterObj.workerEquipChange := edtWorkerEquipChange.Text; 




  end;
end;

procedure TfrmENBusChangeFilterEdit.spbEquipChangeWorkerWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENBusChangeFilterObj.worker = nil then ENBusChangeFilterObj.worker := EquipChangeWorker.Create();
               ENBusChangeFilterObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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