
unit EditENTransformerChangeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransformerChangeController ;

type
  TfrmENTransformerChangeFilterEdit = class(TDialogForm)

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
  

  HTTPRIOENTransformerChange: THTTPRIO;

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
  frmENTransformerChangeFilterEdit: TfrmENTransformerChangeFilterEdit;
  ENTransformerChangeFilterObj: ENTransformerChangeFilter;

implementation

uses
  ShowEquipChangeWorker
  ,EquipChangeWorkerController
;

{uses  
    EnergyproController, EnergyproController2, ENTransformerChangeController  ;
}
{$R *.dfm}



procedure TfrmENTransformerChangeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENTransformerChangeObj.name; 



      if ENTransformerChangeObj.installDate <> nil then
      begin
        edtInstallDate.DateTime:=EncodeDate(ENTransformerChangeObj.installDate.Year,ENTransformerChangeObj.installDate.Month,ENTransformerChangeObj.installDate.Day);
        edtInstallDate.checked := true;
      end
      else
      begin
        edtInstallDate.DateTime:=SysUtils.Date;
        edtInstallDate.checked := false;
      end;



      if ENTransformerChangeObj.uninstallDate <> nil then
      begin
        edtUninstallDate.DateTime:=EncodeDate(ENTransformerChangeObj.uninstallDate.Year,ENTransformerChangeObj.uninstallDate.Month,ENTransformerChangeObj.uninstallDate.Day);
        edtUninstallDate.checked := true;
      end
      else
      begin
        edtUninstallDate.DateTime:=SysUtils.Date;
        edtUninstallDate.checked := false;
      end;



    edtWorkOrderNumber.Text := ENTransformerChangeObj.workOrderNumber; 



      if ENTransformerChangeObj.dateWorkOrder <> nil then
      begin
        edtDateWorkOrder.DateTime:=EncodeDate(ENTransformerChangeObj.dateWorkOrder.Year,ENTransformerChangeObj.dateWorkOrder.Month,ENTransformerChangeObj.dateWorkOrder.Day);
        edtDateWorkOrder.checked := true;
      end
      else
      begin
        edtDateWorkOrder.DateTime:=SysUtils.Date;
        edtDateWorkOrder.checked := false;
      end;



    edtActNumberGen.Text := ENTransformerChangeObj.actNumberGen; 



      if ENTransformerChangeObj.actDateGen <> nil then
      begin
        edtActDateGen.DateTime:=EncodeDate(ENTransformerChangeObj.actDateGen.Year,ENTransformerChangeObj.actDateGen.Month,ENTransformerChangeObj.actDateGen.Day);
        edtActDateGen.checked := true;
      end
      else
      begin
        edtActDateGen.DateTime:=SysUtils.Date;
        edtActDateGen.checked := false;
      end;



    edtWorkerEquipChange.Text := ENTransformerChangeObj.workerEquipChange; 


  end;

}

end;



procedure TfrmENTransformerChangeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransformerChange: ENTransformerChangeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTransformerChangeFilterObj.name := edtName.Text; 



     if edtinstallDate.checked then
     begin 
       if ENTransformerChangeFilterObj.installDate = nil then
          ENTransformerChangeFilterObj.installDate := TXSDate.Create;
       ENTransformerChangeFilterObj.installDate.XSToNative(GetXSDate(edtinstallDate.DateTime));
     end
     else
       ENTransformerChangeFilterObj.installDate := nil;



     if edtuninstallDate.checked then
     begin 
       if ENTransformerChangeFilterObj.uninstallDate = nil then
          ENTransformerChangeFilterObj.uninstallDate := TXSDate.Create;
       ENTransformerChangeFilterObj.uninstallDate.XSToNative(GetXSDate(edtuninstallDate.DateTime));
     end
     else
       ENTransformerChangeFilterObj.uninstallDate := nil;



     ENTransformerChangeFilterObj.workOrderNumber := edtWorkOrderNumber.Text; 



     if edtdateWorkOrder.checked then
     begin 
       if ENTransformerChangeFilterObj.dateWorkOrder = nil then
          ENTransformerChangeFilterObj.dateWorkOrder := TXSDate.Create;
       ENTransformerChangeFilterObj.dateWorkOrder.XSToNative(GetXSDate(edtdateWorkOrder.DateTime));
     end
     else
       ENTransformerChangeFilterObj.dateWorkOrder := nil;



     ENTransformerChangeFilterObj.actNumberGen := edtActNumberGen.Text; 



     if edtactDateGen.checked then
     begin 
       if ENTransformerChangeFilterObj.actDateGen = nil then
          ENTransformerChangeFilterObj.actDateGen := TXSDate.Create;
       ENTransformerChangeFilterObj.actDateGen.XSToNative(GetXSDate(edtactDateGen.DateTime));
     end
     else
       ENTransformerChangeFilterObj.actDateGen := nil;



     ENTransformerChangeFilterObj.workerEquipChange := edtWorkerEquipChange.Text; 




  end;
end;

procedure TfrmENTransformerChangeFilterEdit.spbEquipChangeWorkerWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransformerChangeFilterObj.worker = nil then ENTransformerChangeFilterObj.worker := EquipChangeWorker.Create();
               ENTransformerChangeFilterObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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