
unit EditENTimeLineFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTimeLineController ;

type
  TfrmENTimeLineFilterEdit = class(TDialogForm)

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblTimeStart : TLabel;
    edtTimeStart: TDateTimePicker;
    lblTimeFinal : TLabel;
    edtTimeFinal: TDateTimePicker;
    lblTimeMoveToObject : TLabel;
    edtTimeMoveToObject: TDateTimePicker;
    lblTimeMoveOfObject : TLabel;
    edtTimeMoveOfObject: TDateTimePicker;

  lblENServicesObjectServicesObjectRefName : TLabel;
  edtENServicesObjectServicesObjectRefName : TEdit;
  spbENServicesObjectServicesObjectRef : TSpeedButton;
  
  lblTKVirtualBrigadeVirtualBrigadeRefName : TLabel;
  edtTKVirtualBrigadeVirtualBrigadeRefName : TEdit;
  spbTKVirtualBrigadeVirtualBrigadeRef : TSpeedButton;
  

  HTTPRIOENTimeLine: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENServicesObjectServicesObjectRefClick(Sender : TObject);
  procedure spbTKVirtualBrigadeVirtualBrigadeRefClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTimeLineFilterEdit: TfrmENTimeLineFilterEdit;
  ENTimeLineFilterObj: ENTimeLineFilter;

implementation

uses
  ShowENServicesObject
  ,ENServicesObjectController
  ,ShowTKVirtualBrigade
  ,TKVirtualBrigadeController
;

{uses  
    EnergyproController, EnergyproController2, ENTimeLineController  ;
}
{$R *.dfm}



procedure TfrmENTimeLineFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if ENTimeLineObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENTimeLineObj.dateGen.Year,ENTimeLineObj.dateGen.Month,ENTimeLineObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



      if ENTimeLineObj.timeStart <> nil then
      begin
        edtTimeStart.DateTime:=EncodeDate(ENTimeLineObj.timeStart.Year,ENTimeLineObj.timeStart.Month,ENTimeLineObj.timeStart.Day);
        edtTimeStart.checked := true;
      end
      else
      begin
        edtTimeStart.DateTime:=SysUtils.Date;
        edtTimeStart.checked := false;
      end;	  



      if ENTimeLineObj.timeFinal <> nil then
      begin
        edtTimeFinal.DateTime:=EncodeDate(ENTimeLineObj.timeFinal.Year,ENTimeLineObj.timeFinal.Month,ENTimeLineObj.timeFinal.Day);
        edtTimeFinal.checked := true;
      end
      else
      begin
        edtTimeFinal.DateTime:=SysUtils.Date;
        edtTimeFinal.checked := false;
      end;	  



      if ENTimeLineObj.timeMoveToObject <> nil then
      begin
        edtTimeMoveToObject.DateTime:=EncodeDate(ENTimeLineObj.timeMoveToObject.Year,ENTimeLineObj.timeMoveToObject.Month,ENTimeLineObj.timeMoveToObject.Day);
        edtTimeMoveToObject.checked := true;
      end
      else
      begin
        edtTimeMoveToObject.DateTime:=SysUtils.Date;
        edtTimeMoveToObject.checked := false;
      end;	  



      if ENTimeLineObj.timeMoveOfObject <> nil then
      begin
        edtTimeMoveOfObject.DateTime:=EncodeDate(ENTimeLineObj.timeMoveOfObject.Year,ENTimeLineObj.timeMoveOfObject.Month,ENTimeLineObj.timeMoveOfObject.Day);
        edtTimeMoveOfObject.checked := true;
      end
      else
      begin
        edtTimeMoveOfObject.DateTime:=SysUtils.Date;
        edtTimeMoveOfObject.checked := false;
      end;	  


  end;

}

end;



procedure TfrmENTimeLineFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTimeLine: ENTimeLineControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtdateGen.checked then
     begin 
       if ENTimeLineFilterObj.dateGen = nil then
          ENTimeLineFilterObj.dateGen := TXSDate.Create;
       ENTimeLineFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENTimeLineFilterObj.dateGen := nil;



     if edttimeStart.checked then
     begin 
       if ENTimeLineFilterObj.timeStart = nil then
          ENTimeLineFilterObj.timeStart := TXSDateTime.Create;
       ENTimeLineFilterObj.timeStart.XSToNative(GetXSDate(edttimeStart.DateTime));
     end
     else
       ENTimeLineFilterObj.timeStart := nil;



     if edttimeFinal.checked then
     begin 
       if ENTimeLineFilterObj.timeFinal = nil then
          ENTimeLineFilterObj.timeFinal := TXSDateTime.Create;
       ENTimeLineFilterObj.timeFinal.XSToNative(GetXSDate(edttimeFinal.DateTime));
     end
     else
       ENTimeLineFilterObj.timeFinal := nil;



     if edttimeMoveToObject.checked then
     begin 
       if ENTimeLineFilterObj.timeMoveToObject = nil then
          ENTimeLineFilterObj.timeMoveToObject := TXSDateTime.Create;
       ENTimeLineFilterObj.timeMoveToObject.XSToNative(GetXSDate(edttimeMoveToObject.DateTime));
     end
     else
       ENTimeLineFilterObj.timeMoveToObject := nil;



     if edttimeMoveOfObject.checked then
     begin 
       if ENTimeLineFilterObj.timeMoveOfObject = nil then
          ENTimeLineFilterObj.timeMoveOfObject := TXSDateTime.Create;
       ENTimeLineFilterObj.timeMoveOfObject.XSToNative(GetXSDate(edttimeMoveOfObject.DateTime));
     end
     else
       ENTimeLineFilterObj.timeMoveOfObject := nil;




  end;
end;

procedure TfrmENTimeLineFilterEdit.spbENServicesObjectServicesObjectRefClick(Sender : TObject);
var 
   frmENServicesObjectShow: TfrmENServicesObjectShow;
begin
   frmENServicesObjectShow:=TfrmENServicesObjectShow.Create(Application,fmNormal);
   try
      with frmENServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTimeLineFilterObj.servicesObjectRef = nil then ENTimeLineFilterObj.servicesObjectRef := ENServicesObject.Create();
               ENTimeLineFilterObj.servicesObjectRef.code := StrToInt(GetReturnValue(sgENServicesObject,0));
               edtENServicesObjectServicesObjectRefName.Text:=GetReturnValue(sgENServicesObject,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENServicesObjectShow.Free;
   end;
end;


procedure TfrmENTimeLineFilterEdit.spbTKVirtualBrigadeVirtualBrigadeRefClick(Sender : TObject);
var 
   frmTKVirtualBrigadeShow: TfrmTKVirtualBrigadeShow;
begin
   frmTKVirtualBrigadeShow:=TfrmTKVirtualBrigadeShow.Create(Application,fmNormal);
   try
      with frmTKVirtualBrigadeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTimeLineFilterObj.virtualBrigadeRef = nil then ENTimeLineFilterObj.virtualBrigadeRef := TKVirtualBrigade.Create();
               ENTimeLineFilterObj.virtualBrigadeRef.code := StrToInt(GetReturnValue(sgTKVirtualBrigade,0));
               edtTKVirtualBrigadeVirtualBrigadeRefName.Text:=GetReturnValue(sgTKVirtualBrigade,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKVirtualBrigadeShow.Free;
   end;
end;





end.