
unit EditENTransportRealRepairFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportRealRepairController ;

type
  TfrmENTransportRealRepairFilterEdit = class(TDialogForm)

    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblTKTransportRealRealTransportName : TLabel;
  edtTKTransportRealRealTransportName : TEdit;
  spbTKTransportRealRealTransport : TSpeedButton;
  

  HTTPRIOENTransportRealRepair: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKTransportRealRealTransportClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTransportRealRepairFilterEdit: TfrmENTransportRealRepairFilterEdit;
  ENTransportRealRepairFilterObj: ENTransportRealRepairFilter;

implementation

uses
  ShowTKTransportReal
  ,TKTransportRealController
;

{uses  
    EnergyproController, EnergyproController2, ENTransportRealRepairController  ;
}
{$R *.dfm}



procedure TfrmENTransportRealRepairFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateStart
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if ENTransportRealRepairObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(ENTransportRealRepairObj.dateStart.Year,ENTransportRealRepairObj.dateStart.Month,ENTransportRealRepairObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;



      if ENTransportRealRepairObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(ENTransportRealRepairObj.dateFinal.Year,ENTransportRealRepairObj.dateFinal.Month,ENTransportRealRepairObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;



    edtUserGen.Text := ENTransportRealRepairObj.userGen; 



      if ENTransportRealRepairObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENTransportRealRepairObj.dateEdit.Year,ENTransportRealRepairObj.dateEdit.Month,ENTransportRealRepairObj.dateEdit.Day);
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



procedure TfrmENTransportRealRepairFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportRealRepair: ENTransportRealRepairControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtdateStart.checked then
     begin 
       if ENTransportRealRepairFilterObj.dateStart = nil then
          ENTransportRealRepairFilterObj.dateStart := TXSDate.Create;
       ENTransportRealRepairFilterObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       ENTransportRealRepairFilterObj.dateStart := nil;



     if edtdateFinal.checked then
     begin 
       if ENTransportRealRepairFilterObj.dateFinal = nil then
          ENTransportRealRepairFilterObj.dateFinal := TXSDate.Create;
       ENTransportRealRepairFilterObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       ENTransportRealRepairFilterObj.dateFinal := nil;



     ENTransportRealRepairFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENTransportRealRepairFilterObj.dateEdit = nil then
          ENTransportRealRepairFilterObj.dateEdit := TXSDateTime.Create;
       ENTransportRealRepairFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENTransportRealRepairFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENTransportRealRepairFilterEdit.spbTKTransportRealRealTransportClick(Sender : TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
begin
   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransportRealRepairFilterObj.realTransport = nil then ENTransportRealRepairFilterObj.realTransport := TKTransportReal.Create();
               ENTransportRealRepairFilterObj.realTransport.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
               edtTKTransportRealRealTransportName.Text:=GetReturnValue(sgTKTransportReal,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;





end.