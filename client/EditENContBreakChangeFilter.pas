
unit EditENContBreakChangeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENContBreakChangeController ;

type
  TfrmENContBreakChangeFilterEdit = class(TDialogForm)

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
  

  HTTPRIOENContBreakChange: THTTPRIO;

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
  frmENContBreakChangeFilterEdit: TfrmENContBreakChangeFilterEdit;
  ENContBreakChangeFilterObj: ENContBreakChangeFilter;

implementation

uses
  ShowEquipChangeWorker
  ,EquipChangeWorkerController
;

{uses  
    EnergyproController, EnergyproController2, ENContBreakChangeController  ;
}
{$R *.dfm}



procedure TfrmENContBreakChangeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENContBreakChangeObj.name; 



      if ENContBreakChangeObj.installDate <> nil then
      begin
        edtInstallDate.DateTime:=EncodeDate(ENContBreakChangeObj.installDate.Year,ENContBreakChangeObj.installDate.Month,ENContBreakChangeObj.installDate.Day);
        edtInstallDate.checked := true;
      end
      else
      begin
        edtInstallDate.DateTime:=SysUtils.Date;
        edtInstallDate.checked := false;
      end;



      if ENContBreakChangeObj.uninstallDate <> nil then
      begin
        edtUninstallDate.DateTime:=EncodeDate(ENContBreakChangeObj.uninstallDate.Year,ENContBreakChangeObj.uninstallDate.Month,ENContBreakChangeObj.uninstallDate.Day);
        edtUninstallDate.checked := true;
      end
      else
      begin
        edtUninstallDate.DateTime:=SysUtils.Date;
        edtUninstallDate.checked := false;
      end;



    edtWorkOrderNumber.Text := ENContBreakChangeObj.workOrderNumber; 



      if ENContBreakChangeObj.dateWorkOrder <> nil then
      begin
        edtDateWorkOrder.DateTime:=EncodeDate(ENContBreakChangeObj.dateWorkOrder.Year,ENContBreakChangeObj.dateWorkOrder.Month,ENContBreakChangeObj.dateWorkOrder.Day);
        edtDateWorkOrder.checked := true;
      end
      else
      begin
        edtDateWorkOrder.DateTime:=SysUtils.Date;
        edtDateWorkOrder.checked := false;
      end;



    edtActNumberGen.Text := ENContBreakChangeObj.actNumberGen; 



      if ENContBreakChangeObj.actDateGen <> nil then
      begin
        edtActDateGen.DateTime:=EncodeDate(ENContBreakChangeObj.actDateGen.Year,ENContBreakChangeObj.actDateGen.Month,ENContBreakChangeObj.actDateGen.Day);
        edtActDateGen.checked := true;
      end
      else
      begin
        edtActDateGen.DateTime:=SysUtils.Date;
        edtActDateGen.checked := false;
      end;



    edtWorkerEquipChange.Text := ENContBreakChangeObj.workerEquipChange; 


  end;

}

end;



procedure TfrmENContBreakChangeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENContBreakChange: ENContBreakChangeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENContBreakChangeFilterObj.name := edtName.Text; 



     if edtinstallDate.checked then
     begin 
       if ENContBreakChangeFilterObj.installDate = nil then
          ENContBreakChangeFilterObj.installDate := TXSDate.Create;
       ENContBreakChangeFilterObj.installDate.XSToNative(GetXSDate(edtinstallDate.DateTime));
     end
     else
       ENContBreakChangeFilterObj.installDate := nil;



     if edtuninstallDate.checked then
     begin 
       if ENContBreakChangeFilterObj.uninstallDate = nil then
          ENContBreakChangeFilterObj.uninstallDate := TXSDate.Create;
       ENContBreakChangeFilterObj.uninstallDate.XSToNative(GetXSDate(edtuninstallDate.DateTime));
     end
     else
       ENContBreakChangeFilterObj.uninstallDate := nil;



     ENContBreakChangeFilterObj.workOrderNumber := edtWorkOrderNumber.Text; 



     if edtdateWorkOrder.checked then
     begin 
       if ENContBreakChangeFilterObj.dateWorkOrder = nil then
          ENContBreakChangeFilterObj.dateWorkOrder := TXSDate.Create;
       ENContBreakChangeFilterObj.dateWorkOrder.XSToNative(GetXSDate(edtdateWorkOrder.DateTime));
     end
     else
       ENContBreakChangeFilterObj.dateWorkOrder := nil;



     ENContBreakChangeFilterObj.actNumberGen := edtActNumberGen.Text; 



     if edtactDateGen.checked then
     begin 
       if ENContBreakChangeFilterObj.actDateGen = nil then
          ENContBreakChangeFilterObj.actDateGen := TXSDate.Create;
       ENContBreakChangeFilterObj.actDateGen.XSToNative(GetXSDate(edtactDateGen.DateTime));
     end
     else
       ENContBreakChangeFilterObj.actDateGen := nil;



     ENContBreakChangeFilterObj.workerEquipChange := edtWorkerEquipChange.Text; 




  end;
end;

procedure TfrmENContBreakChangeFilterEdit.spbEquipChangeWorkerWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENContBreakChangeFilterObj.worker = nil then ENContBreakChangeFilterObj.worker := EquipChangeWorker.Create();
               ENContBreakChangeFilterObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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