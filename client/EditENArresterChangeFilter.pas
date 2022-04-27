
unit EditENArresterChangeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENArresterChangeController ;

type
  TfrmENArresterChangeFilterEdit = class(TDialogForm)

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
  

  HTTPRIOENArresterChange: THTTPRIO;

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
  frmENArresterChangeFilterEdit: TfrmENArresterChangeFilterEdit;
  ENArresterChangeFilterObj: ENArresterChangeFilter;

implementation

uses
  ShowEquipChangeWorker
  ,EquipChangeWorkerController
;

{uses  
    EnergyproController, EnergyproController2, ENArresterChangeController  ;
}
{$R *.dfm}



procedure TfrmENArresterChangeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENArresterChangeObj.name; 



      if ENArresterChangeObj.installDate <> nil then
      begin
        edtInstallDate.DateTime:=EncodeDate(ENArresterChangeObj.installDate.Year,ENArresterChangeObj.installDate.Month,ENArresterChangeObj.installDate.Day);
        edtInstallDate.checked := true;
      end
      else
      begin
        edtInstallDate.DateTime:=SysUtils.Date;
        edtInstallDate.checked := false;
      end;



      if ENArresterChangeObj.uninstallDate <> nil then
      begin
        edtUninstallDate.DateTime:=EncodeDate(ENArresterChangeObj.uninstallDate.Year,ENArresterChangeObj.uninstallDate.Month,ENArresterChangeObj.uninstallDate.Day);
        edtUninstallDate.checked := true;
      end
      else
      begin
        edtUninstallDate.DateTime:=SysUtils.Date;
        edtUninstallDate.checked := false;
      end;



    edtWorkOrderNumber.Text := ENArresterChangeObj.workOrderNumber; 



      if ENArresterChangeObj.dateWorkOrder <> nil then
      begin
        edtDateWorkOrder.DateTime:=EncodeDate(ENArresterChangeObj.dateWorkOrder.Year,ENArresterChangeObj.dateWorkOrder.Month,ENArresterChangeObj.dateWorkOrder.Day);
        edtDateWorkOrder.checked := true;
      end
      else
      begin
        edtDateWorkOrder.DateTime:=SysUtils.Date;
        edtDateWorkOrder.checked := false;
      end;



    edtActNumberGen.Text := ENArresterChangeObj.actNumberGen; 



      if ENArresterChangeObj.actDateGen <> nil then
      begin
        edtActDateGen.DateTime:=EncodeDate(ENArresterChangeObj.actDateGen.Year,ENArresterChangeObj.actDateGen.Month,ENArresterChangeObj.actDateGen.Day);
        edtActDateGen.checked := true;
      end
      else
      begin
        edtActDateGen.DateTime:=SysUtils.Date;
        edtActDateGen.checked := false;
      end;



    edtWorkerEquipChange.Text := ENArresterChangeObj.workerEquipChange; 


  end;

}

end;



procedure TfrmENArresterChangeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENArresterChange: ENArresterChangeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENArresterChangeFilterObj.name := edtName.Text; 



     if edtinstallDate.checked then
     begin 
       if ENArresterChangeFilterObj.installDate = nil then
          ENArresterChangeFilterObj.installDate := TXSDate.Create;
       ENArresterChangeFilterObj.installDate.XSToNative(GetXSDate(edtinstallDate.DateTime));
     end
     else
       ENArresterChangeFilterObj.installDate := nil;



     if edtuninstallDate.checked then
     begin 
       if ENArresterChangeFilterObj.uninstallDate = nil then
          ENArresterChangeFilterObj.uninstallDate := TXSDate.Create;
       ENArresterChangeFilterObj.uninstallDate.XSToNative(GetXSDate(edtuninstallDate.DateTime));
     end
     else
       ENArresterChangeFilterObj.uninstallDate := nil;



     ENArresterChangeFilterObj.workOrderNumber := edtWorkOrderNumber.Text; 



     if edtdateWorkOrder.checked then
     begin 
       if ENArresterChangeFilterObj.dateWorkOrder = nil then
          ENArresterChangeFilterObj.dateWorkOrder := TXSDate.Create;
       ENArresterChangeFilterObj.dateWorkOrder.XSToNative(GetXSDate(edtdateWorkOrder.DateTime));
     end
     else
       ENArresterChangeFilterObj.dateWorkOrder := nil;



     ENArresterChangeFilterObj.actNumberGen := edtActNumberGen.Text; 



     if edtactDateGen.checked then
     begin 
       if ENArresterChangeFilterObj.actDateGen = nil then
          ENArresterChangeFilterObj.actDateGen := TXSDate.Create;
       ENArresterChangeFilterObj.actDateGen.XSToNative(GetXSDate(edtactDateGen.DateTime));
     end
     else
       ENArresterChangeFilterObj.actDateGen := nil;



     ENArresterChangeFilterObj.workerEquipChange := edtWorkerEquipChange.Text; 




  end;
end;

procedure TfrmENArresterChangeFilterEdit.spbEquipChangeWorkerWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENArresterChangeFilterObj.worker = nil then ENArresterChangeFilterObj.worker := EquipChangeWorker.Create();
               ENArresterChangeFilterObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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