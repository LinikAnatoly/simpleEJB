
unit EditENCurTransformerChangeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCurTransformerChangeController ;

type
  TfrmENCurTransformerChangeFilterEdit = class(TDialogForm)

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
  

  HTTPRIOENCurTransformerChange: THTTPRIO;

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
  frmENCurTransformerChangeFilterEdit: TfrmENCurTransformerChangeFilterEdit;
  ENCurTransformerChangeFilterObj: ENCurTransformerChangeFilter;

implementation

uses
  ShowEquipChangeWorker
  ,EquipChangeWorkerController
;

{uses  
    EnergyproController, EnergyproController2, ENCurTransformerChangeController  ;
}
{$R *.dfm}



procedure TfrmENCurTransformerChangeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENCurTransformerChangeObj.name; 



      if ENCurTransformerChangeObj.installDate <> nil then
      begin
        edtInstallDate.DateTime:=EncodeDate(ENCurTransformerChangeObj.installDate.Year,ENCurTransformerChangeObj.installDate.Month,ENCurTransformerChangeObj.installDate.Day);
        edtInstallDate.checked := true;
      end
      else
      begin
        edtInstallDate.DateTime:=SysUtils.Date;
        edtInstallDate.checked := false;
      end;



      if ENCurTransformerChangeObj.uninstallDate <> nil then
      begin
        edtUninstallDate.DateTime:=EncodeDate(ENCurTransformerChangeObj.uninstallDate.Year,ENCurTransformerChangeObj.uninstallDate.Month,ENCurTransformerChangeObj.uninstallDate.Day);
        edtUninstallDate.checked := true;
      end
      else
      begin
        edtUninstallDate.DateTime:=SysUtils.Date;
        edtUninstallDate.checked := false;
      end;



    edtWorkOrderNumber.Text := ENCurTransformerChangeObj.workOrderNumber; 



      if ENCurTransformerChangeObj.dateWorkOrder <> nil then
      begin
        edtDateWorkOrder.DateTime:=EncodeDate(ENCurTransformerChangeObj.dateWorkOrder.Year,ENCurTransformerChangeObj.dateWorkOrder.Month,ENCurTransformerChangeObj.dateWorkOrder.Day);
        edtDateWorkOrder.checked := true;
      end
      else
      begin
        edtDateWorkOrder.DateTime:=SysUtils.Date;
        edtDateWorkOrder.checked := false;
      end;



    edtActNumberGen.Text := ENCurTransformerChangeObj.actNumberGen; 



      if ENCurTransformerChangeObj.actDateGen <> nil then
      begin
        edtActDateGen.DateTime:=EncodeDate(ENCurTransformerChangeObj.actDateGen.Year,ENCurTransformerChangeObj.actDateGen.Month,ENCurTransformerChangeObj.actDateGen.Day);
        edtActDateGen.checked := true;
      end
      else
      begin
        edtActDateGen.DateTime:=SysUtils.Date;
        edtActDateGen.checked := false;
      end;



    edtWorkerEquipChange.Text := ENCurTransformerChangeObj.workerEquipChange; 


  end;

}

end;



procedure TfrmENCurTransformerChangeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCurTransformerChange: ENCurTransformerChangeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENCurTransformerChangeFilterObj.name := edtName.Text; 



     if edtinstallDate.checked then
     begin 
       if ENCurTransformerChangeFilterObj.installDate = nil then
          ENCurTransformerChangeFilterObj.installDate := TXSDate.Create;
       ENCurTransformerChangeFilterObj.installDate.XSToNative(GetXSDate(edtinstallDate.DateTime));
     end
     else
       ENCurTransformerChangeFilterObj.installDate := nil;



     if edtuninstallDate.checked then
     begin 
       if ENCurTransformerChangeFilterObj.uninstallDate = nil then
          ENCurTransformerChangeFilterObj.uninstallDate := TXSDate.Create;
       ENCurTransformerChangeFilterObj.uninstallDate.XSToNative(GetXSDate(edtuninstallDate.DateTime));
     end
     else
       ENCurTransformerChangeFilterObj.uninstallDate := nil;



     ENCurTransformerChangeFilterObj.workOrderNumber := edtWorkOrderNumber.Text; 



     if edtdateWorkOrder.checked then
     begin 
       if ENCurTransformerChangeFilterObj.dateWorkOrder = nil then
          ENCurTransformerChangeFilterObj.dateWorkOrder := TXSDate.Create;
       ENCurTransformerChangeFilterObj.dateWorkOrder.XSToNative(GetXSDate(edtdateWorkOrder.DateTime));
     end
     else
       ENCurTransformerChangeFilterObj.dateWorkOrder := nil;



     ENCurTransformerChangeFilterObj.actNumberGen := edtActNumberGen.Text; 



     if edtactDateGen.checked then
     begin 
       if ENCurTransformerChangeFilterObj.actDateGen = nil then
          ENCurTransformerChangeFilterObj.actDateGen := TXSDate.Create;
       ENCurTransformerChangeFilterObj.actDateGen.XSToNative(GetXSDate(edtactDateGen.DateTime));
     end
     else
       ENCurTransformerChangeFilterObj.actDateGen := nil;



     ENCurTransformerChangeFilterObj.workerEquipChange := edtWorkerEquipChange.Text; 




  end;
end;

procedure TfrmENCurTransformerChangeFilterEdit.spbEquipChangeWorkerWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENCurTransformerChangeFilterObj.worker = nil then ENCurTransformerChangeFilterObj.worker := EquipChangeWorker.Create();
               ENCurTransformerChangeFilterObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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