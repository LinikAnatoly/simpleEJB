
unit EditENReportAdditionZbytMetrologyFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENReportAdditionZbytMetrologyController ;

type
  TfrmENReportAdditionZbytMetrologyFilterEdit = class(TDialogForm)

    lblWorkCode : TLabel;
    edtWorkCode: TMemo;

    lblName : TLabel;
    edtName: TMemo;

    lblIsServices : TLabel;
    edtIsServices: TEdit;

    lblZbytOrmetrology : TLabel;
    edtZbytOrmetrology: TEdit;

    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;


  HTTPRIOENReportAdditionZbytMetrology: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENReportAdditionZbytMetrologyFilterEdit: TfrmENReportAdditionZbytMetrologyFilterEdit;
  ENReportAdditionZbytMetrologyFilterObj: ENReportAdditionZbytMetrologyFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENReportAdditionZbytMetrologyController  ;
}
{$R *.dfm}



procedure TfrmENReportAdditionZbytMetrologyFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtWorkCode
      ,edtName
      ,edtIsServices
      ,edtZbytOrmetrology
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    MakeMultiline(edtWorkCode.Lines, ENReportAdditionZbytMetrologyObj.workCode);



    MakeMultiline(edtName.Lines, ENReportAdditionZbytMetrologyObj.name);



    if ( ENReportAdditionZbytMetrologyObj.isServices <> Low(Integer) ) then
       edtIsServices.Text := IntToStr(ENReportAdditionZbytMetrologyObj.isServices)
    else
       edtIsServices.Text := '';



    edtZbytOrmetrology.Text := ENReportAdditionZbytMetrologyObj.zbytOrmetrology; 



      if ENReportAdditionZbytMetrologyObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(ENReportAdditionZbytMetrologyObj.dateStart.Year,ENReportAdditionZbytMetrologyObj.dateStart.Month,ENReportAdditionZbytMetrologyObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;	  



      if ENReportAdditionZbytMetrologyObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(ENReportAdditionZbytMetrologyObj.dateFinal.Year,ENReportAdditionZbytMetrologyObj.dateFinal.Month,ENReportAdditionZbytMetrologyObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;	  


  end;

}

end;



procedure TfrmENReportAdditionZbytMetrologyFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENReportAdditionZbytMetrology: ENReportAdditionZbytMetrologyControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENReportAdditionZbytMetrologyFilterObj.workCode := edtWorkCode.Text; 



     ENReportAdditionZbytMetrologyFilterObj.name := edtName.Text; 



     if ( edtIsServices.Text <> '' ) then
       ENReportAdditionZbytMetrologyFilterObj.isServices := StrToInt(edtIsServices.Text)
     else
       ENReportAdditionZbytMetrologyFilterObj.isServices := Low(Integer) ;
	   



     ENReportAdditionZbytMetrologyFilterObj.zbytOrmetrology := edtZbytOrmetrology.Text; 



     if edtdateStart.checked then
     begin 
       if ENReportAdditionZbytMetrologyFilterObj.dateStart = nil then
          ENReportAdditionZbytMetrologyFilterObj.dateStart := TXSDateTime.Create;
       ENReportAdditionZbytMetrologyFilterObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       ENReportAdditionZbytMetrologyFilterObj.dateStart := nil;



     if edtdateFinal.checked then
     begin 
       if ENReportAdditionZbytMetrologyFilterObj.dateFinal = nil then
          ENReportAdditionZbytMetrologyFilterObj.dateFinal := TXSDateTime.Create;
       ENReportAdditionZbytMetrologyFilterObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       ENReportAdditionZbytMetrologyFilterObj.dateFinal := nil;




  end;
end;




end.