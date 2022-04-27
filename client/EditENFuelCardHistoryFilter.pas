
unit EditENFuelCardHistoryFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuelCardHistoryController ;

type
  TfrmENFuelCardHistoryFilterEdit = class(TDialogForm)

    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;
    lblReg_id : TLabel;
    edtReg_id: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblFINWorkerFinWorkerName : TLabel;
  edtFINWorkerFinWorkerName : TEdit;
  spbFINWorkerFinWorker : TSpeedButton;
  
  lblENFuelCardFuelCardName : TLabel;
  edtENFuelCardFuelCardName : TEdit;
  spbENFuelCardFuelCard : TSpeedButton;
  

  HTTPRIOENFuelCardHistory: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbFINWorkerFinWorkerClick(Sender : TObject);
  procedure spbENFuelCardFuelCardClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENFuelCardHistoryFilterEdit: TfrmENFuelCardHistoryFilterEdit;
  ENFuelCardHistoryFilterObj: ENFuelCardHistoryFilter;

implementation

uses
  ShowFINWorker
  ,FINWorkerController
  ,ShowENFuelCard
  ,ENFuelCardController
;

{uses  
    EnergyproController, EnergyproController2, ENFuelCardHistoryController  ;
}
{$R *.dfm}



procedure TfrmENFuelCardHistoryFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateStart
      ,edtReg_id
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if ENFuelCardHistoryObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(ENFuelCardHistoryObj.dateStart.Year,ENFuelCardHistoryObj.dateStart.Month,ENFuelCardHistoryObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;



      if ENFuelCardHistoryObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(ENFuelCardHistoryObj.dateFinal.Year,ENFuelCardHistoryObj.dateFinal.Month,ENFuelCardHistoryObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;



    edtReg_id.Text := ENFuelCardHistoryObj.reg_id; 



    edtUserGen.Text := ENFuelCardHistoryObj.userGen; 



      if ENFuelCardHistoryObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENFuelCardHistoryObj.dateEdit.Year,ENFuelCardHistoryObj.dateEdit.Month,ENFuelCardHistoryObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  


  end;

}

end;



procedure TfrmENFuelCardHistoryFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelCardHistory: ENFuelCardHistoryControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtdateStart.checked then
     begin 
       if ENFuelCardHistoryFilterObj.dateStart = nil then
          ENFuelCardHistoryFilterObj.dateStart := TXSDate.Create;
       ENFuelCardHistoryFilterObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       ENFuelCardHistoryFilterObj.dateStart := nil;



     if edtdateFinal.checked then
     begin 
       if ENFuelCardHistoryFilterObj.dateFinal = nil then
          ENFuelCardHistoryFilterObj.dateFinal := TXSDate.Create;
       ENFuelCardHistoryFilterObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       ENFuelCardHistoryFilterObj.dateFinal := nil;



     ENFuelCardHistoryFilterObj.reg_id := edtReg_id.Text; 



     ENFuelCardHistoryFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENFuelCardHistoryFilterObj.dateEdit = nil then
          ENFuelCardHistoryFilterObj.dateEdit := TXSDateTime.Create;
       ENFuelCardHistoryFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENFuelCardHistoryFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENFuelCardHistoryFilterEdit.spbFINWorkerFinWorkerClick(Sender : TObject);
var 
   frmFINWorkerShow: TfrmFINWorkerShow;
begin
   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal);
   try
      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENFuelCardHistoryFilterObj.finWorker = nil then ENFuelCardHistoryFilterObj.finWorker := FINWorker.Create();
               ENFuelCardHistoryFilterObj.finWorker.code := StrToInt(GetReturnValue(sgFINWorker,0));
               edtFINWorkerFinWorkerName.Text:=GetReturnValue(sgFINWorker,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;


procedure TfrmENFuelCardHistoryFilterEdit.spbENFuelCardFuelCardClick(Sender : TObject);
var 
   frmENFuelCardShow: TfrmENFuelCardShow;
begin
   frmENFuelCardShow:=TfrmENFuelCardShow.Create(Application,fmNormal);
   try
      with frmENFuelCardShow do
        if ShowModal = mrOk then
        begin
            try
               if ENFuelCardHistoryFilterObj.fuelCard = nil then ENFuelCardHistoryFilterObj.fuelCard := ENFuelCard.Create();
               ENFuelCardHistoryFilterObj.fuelCard.code := StrToInt(GetReturnValue(sgENFuelCard,0));
               edtENFuelCardFuelCardName.Text:=GetReturnValue(sgENFuelCard,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENFuelCardShow.Free;
   end;
end;





end.