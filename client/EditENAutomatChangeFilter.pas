
unit EditENAutomatChangeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAutomatChangeController ;

type
  TfrmENAutomatChangeFilterEdit = class(TDialogForm)

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
  

  HTTPRIOENAutomatChange: THTTPRIO;

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
  frmENAutomatChangeFilterEdit: TfrmENAutomatChangeFilterEdit;
  ENAutomatChangeFilterObj: ENAutomatChangeFilter;

implementation

uses
  ShowEquipChangeWorker
  ,EquipChangeWorkerController
;

{uses  
    EnergyproController, EnergyproController2, ENAutomatChangeController  ;
}
{$R *.dfm}



procedure TfrmENAutomatChangeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENAutomatChangeObj.name; 



      if ENAutomatChangeObj.installDate <> nil then
      begin
        edtInstallDate.DateTime:=EncodeDate(ENAutomatChangeObj.installDate.Year,ENAutomatChangeObj.installDate.Month,ENAutomatChangeObj.installDate.Day);
        edtInstallDate.checked := true;
      end
      else
      begin
        edtInstallDate.DateTime:=SysUtils.Date;
        edtInstallDate.checked := false;
      end;



      if ENAutomatChangeObj.uninstallDate <> nil then
      begin
        edtUninstallDate.DateTime:=EncodeDate(ENAutomatChangeObj.uninstallDate.Year,ENAutomatChangeObj.uninstallDate.Month,ENAutomatChangeObj.uninstallDate.Day);
        edtUninstallDate.checked := true;
      end
      else
      begin
        edtUninstallDate.DateTime:=SysUtils.Date;
        edtUninstallDate.checked := false;
      end;



    edtWorkOrderNumber.Text := ENAutomatChangeObj.workOrderNumber; 



      if ENAutomatChangeObj.dateWorkOrder <> nil then
      begin
        edtDateWorkOrder.DateTime:=EncodeDate(ENAutomatChangeObj.dateWorkOrder.Year,ENAutomatChangeObj.dateWorkOrder.Month,ENAutomatChangeObj.dateWorkOrder.Day);
        edtDateWorkOrder.checked := true;
      end
      else
      begin
        edtDateWorkOrder.DateTime:=SysUtils.Date;
        edtDateWorkOrder.checked := false;
      end;



    edtActNumberGen.Text := ENAutomatChangeObj.actNumberGen; 



      if ENAutomatChangeObj.actDateGen <> nil then
      begin
        edtActDateGen.DateTime:=EncodeDate(ENAutomatChangeObj.actDateGen.Year,ENAutomatChangeObj.actDateGen.Month,ENAutomatChangeObj.actDateGen.Day);
        edtActDateGen.checked := true;
      end
      else
      begin
        edtActDateGen.DateTime:=SysUtils.Date;
        edtActDateGen.checked := false;
      end;



    edtWorkerEquipChange.Text := ENAutomatChangeObj.workerEquipChange; 


  end;

}

end;



procedure TfrmENAutomatChangeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAutomatChange: ENAutomatChangeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENAutomatChangeFilterObj.name := edtName.Text; 



     if edtinstallDate.checked then
     begin 
       if ENAutomatChangeFilterObj.installDate = nil then
          ENAutomatChangeFilterObj.installDate := TXSDate.Create;
       ENAutomatChangeFilterObj.installDate.XSToNative(GetXSDate(edtinstallDate.DateTime));
     end
     else
       ENAutomatChangeFilterObj.installDate := nil;



     if edtuninstallDate.checked then
     begin 
       if ENAutomatChangeFilterObj.uninstallDate = nil then
          ENAutomatChangeFilterObj.uninstallDate := TXSDate.Create;
       ENAutomatChangeFilterObj.uninstallDate.XSToNative(GetXSDate(edtuninstallDate.DateTime));
     end
     else
       ENAutomatChangeFilterObj.uninstallDate := nil;



     ENAutomatChangeFilterObj.workOrderNumber := edtWorkOrderNumber.Text; 



     if edtdateWorkOrder.checked then
     begin 
       if ENAutomatChangeFilterObj.dateWorkOrder = nil then
          ENAutomatChangeFilterObj.dateWorkOrder := TXSDate.Create;
       ENAutomatChangeFilterObj.dateWorkOrder.XSToNative(GetXSDate(edtdateWorkOrder.DateTime));
     end
     else
       ENAutomatChangeFilterObj.dateWorkOrder := nil;



     ENAutomatChangeFilterObj.actNumberGen := edtActNumberGen.Text; 



     if edtactDateGen.checked then
     begin 
       if ENAutomatChangeFilterObj.actDateGen = nil then
          ENAutomatChangeFilterObj.actDateGen := TXSDate.Create;
       ENAutomatChangeFilterObj.actDateGen.XSToNative(GetXSDate(edtactDateGen.DateTime));
     end
     else
       ENAutomatChangeFilterObj.actDateGen := nil;



     ENAutomatChangeFilterObj.workerEquipChange := edtWorkerEquipChange.Text; 




  end;
end;

procedure TfrmENAutomatChangeFilterEdit.spbEquipChangeWorkerWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENAutomatChangeFilterObj.worker = nil then ENAutomatChangeFilterObj.worker := EquipChangeWorker.Create();
               ENAutomatChangeFilterObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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