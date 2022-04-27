
unit EditENDisconnectorChangeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDisconnectorChangeController ;

type
  TfrmENDisconnectorChangeFilterEdit = class(TDialogForm)

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
  

  HTTPRIOENDisconnectorChange: THTTPRIO;

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
  frmENDisconnectorChangeFilterEdit: TfrmENDisconnectorChangeFilterEdit;
  ENDisconnectorChangeFilterObj: ENDisconnectorChangeFilter;

implementation

uses
  ShowEquipChangeWorker
  ,EquipChangeWorkerController
;

{uses  
    EnergyproController, EnergyproController2, ENDisconnectorChangeController  ;
}
{$R *.dfm}



procedure TfrmENDisconnectorChangeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENDisconnectorChangeObj.name; 



      if ENDisconnectorChangeObj.installDate <> nil then
      begin
        edtInstallDate.DateTime:=EncodeDate(ENDisconnectorChangeObj.installDate.Year,ENDisconnectorChangeObj.installDate.Month,ENDisconnectorChangeObj.installDate.Day);
        edtInstallDate.checked := true;
      end
      else
      begin
        edtInstallDate.DateTime:=SysUtils.Date;
        edtInstallDate.checked := false;
      end;



      if ENDisconnectorChangeObj.uninstallDate <> nil then
      begin
        edtUninstallDate.DateTime:=EncodeDate(ENDisconnectorChangeObj.uninstallDate.Year,ENDisconnectorChangeObj.uninstallDate.Month,ENDisconnectorChangeObj.uninstallDate.Day);
        edtUninstallDate.checked := true;
      end
      else
      begin
        edtUninstallDate.DateTime:=SysUtils.Date;
        edtUninstallDate.checked := false;
      end;



    edtWorkOrderNumber.Text := ENDisconnectorChangeObj.workOrderNumber; 



      if ENDisconnectorChangeObj.dateWorkOrder <> nil then
      begin
        edtDateWorkOrder.DateTime:=EncodeDate(ENDisconnectorChangeObj.dateWorkOrder.Year,ENDisconnectorChangeObj.dateWorkOrder.Month,ENDisconnectorChangeObj.dateWorkOrder.Day);
        edtDateWorkOrder.checked := true;
      end
      else
      begin
        edtDateWorkOrder.DateTime:=SysUtils.Date;
        edtDateWorkOrder.checked := false;
      end;



    edtActNumberGen.Text := ENDisconnectorChangeObj.actNumberGen; 



      if ENDisconnectorChangeObj.actDateGen <> nil then
      begin
        edtActDateGen.DateTime:=EncodeDate(ENDisconnectorChangeObj.actDateGen.Year,ENDisconnectorChangeObj.actDateGen.Month,ENDisconnectorChangeObj.actDateGen.Day);
        edtActDateGen.checked := true;
      end
      else
      begin
        edtActDateGen.DateTime:=SysUtils.Date;
        edtActDateGen.checked := false;
      end;



    edtWorkerEquipChange.Text := ENDisconnectorChangeObj.workerEquipChange; 


  end;

}

end;



procedure TfrmENDisconnectorChangeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDisconnectorChange: ENDisconnectorChangeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENDisconnectorChangeFilterObj.name := edtName.Text; 



     if edtinstallDate.checked then
     begin 
       if ENDisconnectorChangeFilterObj.installDate = nil then
          ENDisconnectorChangeFilterObj.installDate := TXSDate.Create;
       ENDisconnectorChangeFilterObj.installDate.XSToNative(GetXSDate(edtinstallDate.DateTime));
     end
     else
       ENDisconnectorChangeFilterObj.installDate := nil;



     if edtuninstallDate.checked then
     begin 
       if ENDisconnectorChangeFilterObj.uninstallDate = nil then
          ENDisconnectorChangeFilterObj.uninstallDate := TXSDate.Create;
       ENDisconnectorChangeFilterObj.uninstallDate.XSToNative(GetXSDate(edtuninstallDate.DateTime));
     end
     else
       ENDisconnectorChangeFilterObj.uninstallDate := nil;



     ENDisconnectorChangeFilterObj.workOrderNumber := edtWorkOrderNumber.Text; 



     if edtdateWorkOrder.checked then
     begin 
       if ENDisconnectorChangeFilterObj.dateWorkOrder = nil then
          ENDisconnectorChangeFilterObj.dateWorkOrder := TXSDate.Create;
       ENDisconnectorChangeFilterObj.dateWorkOrder.XSToNative(GetXSDate(edtdateWorkOrder.DateTime));
     end
     else
       ENDisconnectorChangeFilterObj.dateWorkOrder := nil;



     ENDisconnectorChangeFilterObj.actNumberGen := edtActNumberGen.Text; 



     if edtactDateGen.checked then
     begin 
       if ENDisconnectorChangeFilterObj.actDateGen = nil then
          ENDisconnectorChangeFilterObj.actDateGen := TXSDate.Create;
       ENDisconnectorChangeFilterObj.actDateGen.XSToNative(GetXSDate(edtactDateGen.DateTime));
     end
     else
       ENDisconnectorChangeFilterObj.actDateGen := nil;



     ENDisconnectorChangeFilterObj.workerEquipChange := edtWorkerEquipChange.Text; 




  end;
end;

procedure TfrmENDisconnectorChangeFilterEdit.spbEquipChangeWorkerWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENDisconnectorChangeFilterObj.worker = nil then ENDisconnectorChangeFilterObj.worker := EquipChangeWorker.Create();
               ENDisconnectorChangeFilterObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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