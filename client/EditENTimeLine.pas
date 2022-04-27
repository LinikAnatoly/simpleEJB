
unit EditENTimeLine;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTimeLineController ;

type
  TfrmENTimeLineEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
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
  frmENTimeLineEdit: TfrmENTimeLineEdit;
  ENTimeLineObj: ENTimeLine;

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



procedure TfrmENTimeLineEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENServicesObjectServicesObjectRefName
      ,spbENServicesObjectServicesObjectRef
      ,edtTKVirtualBrigadeVirtualBrigadeRefName
      ,spbTKVirtualBrigadeVirtualBrigadeRef
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENTimeLineObj.code);
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

    edtENServicesObjectServicesObjectRefName.Text := ENTimeLineObj.servicesObjectRef.name;
    edtTKVirtualBrigadeVirtualBrigadeRefName.Text := ENTimeLineObj.virtualBrigadeRef.name;

  end;
end;



procedure TfrmENTimeLineEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTimeLine: ENTimeLineControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTimeLine := HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;


     if edtdateGen.checked then
     begin 
       if ENTimeLineObj.dateGen = nil then
          ENTimeLineObj.dateGen := TXSDate.Create;
       ENTimeLineObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENTimeLineObj.dateGen := nil;

     if edttimeStart.checked then
     begin 
       if ENTimeLineObj.timeStart = nil then
          ENTimeLineObj.timeStart := TXSDateTime.Create;
       ENTimeLineObj.timeStart.XSToNative(GetXSDate(edttimeStart.DateTime));
     end
     else
       ENTimeLineObj.timeStart := nil;	   

     if edttimeFinal.checked then
     begin 
       if ENTimeLineObj.timeFinal = nil then
          ENTimeLineObj.timeFinal := TXSDateTime.Create;
       ENTimeLineObj.timeFinal.XSToNative(GetXSDate(edttimeFinal.DateTime));
     end
     else
       ENTimeLineObj.timeFinal := nil;	   

     if edttimeMoveToObject.checked then
     begin 
       if ENTimeLineObj.timeMoveToObject = nil then
          ENTimeLineObj.timeMoveToObject := TXSDateTime.Create;
       ENTimeLineObj.timeMoveToObject.XSToNative(GetXSDate(edttimeMoveToObject.DateTime));
     end
     else
       ENTimeLineObj.timeMoveToObject := nil;	   

     if edttimeMoveOfObject.checked then
     begin 
       if ENTimeLineObj.timeMoveOfObject = nil then
          ENTimeLineObj.timeMoveOfObject := TXSDateTime.Create;
       ENTimeLineObj.timeMoveOfObject.XSToNative(GetXSDate(edttimeMoveOfObject.DateTime));
     end
     else
       ENTimeLineObj.timeMoveOfObject := nil;	   

    if DialogState = dsInsert then
    begin
      ENTimeLineObj.code:=low(Integer);
      TempENTimeLine.add(ENTimeLineObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTimeLine.save(ENTimeLineObj);
    end;
  end;
end;


procedure TfrmENTimeLineEdit.spbENServicesObjectServicesObjectRefClick(Sender : TObject);
var 
   frmENServicesObjectShow: TfrmENServicesObjectShow;
begin
   frmENServicesObjectShow:=TfrmENServicesObjectShow.Create(Application,fmNormal);
   try
      with frmENServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTimeLineObj.servicesObjectRef = nil then ENTimeLineObj.servicesObjectRef := ENServicesObject.Create();
               ENTimeLineObj.servicesObjectRef.code := StrToInt(GetReturnValue(sgENServicesObject,0));
               edtENServicesObjectServicesObjectRefName.Text:=GetReturnValue(sgENServicesObject,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENServicesObjectShow.Free;
   end;
end;



procedure TfrmENTimeLineEdit.spbTKVirtualBrigadeVirtualBrigadeRefClick(Sender : TObject);
var 
   frmTKVirtualBrigadeShow: TfrmTKVirtualBrigadeShow;
begin
   frmTKVirtualBrigadeShow:=TfrmTKVirtualBrigadeShow.Create(Application,fmNormal);
   try
      with frmTKVirtualBrigadeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTimeLineObj.virtualBrigadeRef = nil then ENTimeLineObj.virtualBrigadeRef := TKVirtualBrigade.Create();
               ENTimeLineObj.virtualBrigadeRef.code := StrToInt(GetReturnValue(sgTKVirtualBrigade,0));
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