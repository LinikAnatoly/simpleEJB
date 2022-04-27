
unit EditENActIncomeTechConditionsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActIncomeTechConditionsController ;

type
  TfrmENActIncomeTechConditionsFilterEdit = class(TDialogForm)

    lblNumbergen : TLabel;
    edtNumbergen: TEdit;

    lblDategen : TLabel;
    edtDategen: TDateTimePicker;
    lblActDateStart : TLabel;
    edtActDateStart: TDateTimePicker;
    lblActDateEnd : TLabel;
    edtActDateEnd: TDateTimePicker;
    lblSummaGen : TLabel;
    edtSummaGen: TEdit;

    lblSummaVat : TLabel;
    edtSummaVat: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TEdit;



  HTTPRIOENActIncomeTechConditions: THTTPRIO;

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
  frmENActIncomeTechConditionsFilterEdit: TfrmENActIncomeTechConditionsFilterEdit;
  ENActIncomeTechConditionsFilterObj: ENActIncomeTechConditionsFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActIncomeTechConditionsController  ;
}
{$R *.dfm}



procedure TfrmENActIncomeTechConditionsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumbergen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumbergen.Text := ENActIncomeTechConditionsObj.numbergen; 



      if ENActIncomeTechConditionsObj.dategen <> nil then
      begin
        edtDategen.DateTime:=EncodeDate(ENActIncomeTechConditionsObj.dategen.Year,ENActIncomeTechConditionsObj.dategen.Month,ENActIncomeTechConditionsObj.dategen.Day);
        edtDategen.checked := true;
      end
      else
      begin
        edtDategen.DateTime:=SysUtils.Date;
        edtDategen.checked := false;
      end;



      if ENActIncomeTechConditionsObj.actDateStart <> nil then
      begin
        edtActDateStart.DateTime:=EncodeDate(ENActIncomeTechConditionsObj.actDateStart.Year,ENActIncomeTechConditionsObj.actDateStart.Month,ENActIncomeTechConditionsObj.actDateStart.Day);
        edtActDateStart.checked := true;
      end
      else
      begin
        edtActDateStart.DateTime:=SysUtils.Date;
        edtActDateStart.checked := false;
      end;



      if ENActIncomeTechConditionsObj.actDateEnd <> nil then
      begin
        edtActDateEnd.DateTime:=EncodeDate(ENActIncomeTechConditionsObj.actDateEnd.Year,ENActIncomeTechConditionsObj.actDateEnd.Month,ENActIncomeTechConditionsObj.actDateEnd.Day);
        edtActDateEnd.checked := true;
      end
      else
      begin
        edtActDateEnd.DateTime:=SysUtils.Date;
        edtActDateEnd.checked := false;
      end;



    if ( ENActIncomeTechConditionsObj.summaGen <> nil ) then
       edtSummaGen.Text := ENActIncomeTechConditionsObj.summaGen.decimalString
    else
       edtSummaGen.Text := ''; 



    if ( ENActIncomeTechConditionsObj.summaVat <> nil ) then
       edtSummaVat.Text := ENActIncomeTechConditionsObj.summaVat.decimalString
    else
       edtSummaVat.Text := ''; 



    edtCommentGen.Text := ENActIncomeTechConditionsObj.commentGen; 


  end;

}

end;



procedure TfrmENActIncomeTechConditionsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENActIncomeTechConditionsFilterObj.numbergen := edtNumbergen.Text; 



     if edtdategen.checked then
     begin 
       if ENActIncomeTechConditionsFilterObj.dategen = nil then
          ENActIncomeTechConditionsFilterObj.dategen := TXSDate.Create;
       ENActIncomeTechConditionsFilterObj.dategen.XSToNative(GetXSDate(edtdategen.DateTime));
     end
     else
       ENActIncomeTechConditionsFilterObj.dategen := nil;



     if edtactDateStart.checked then
     begin 
       if ENActIncomeTechConditionsFilterObj.actDateStart = nil then
          ENActIncomeTechConditionsFilterObj.actDateStart := TXSDate.Create;
       ENActIncomeTechConditionsFilterObj.actDateStart.XSToNative(GetXSDate(edtactDateStart.DateTime));
     end
     else
       ENActIncomeTechConditionsFilterObj.actDateStart := nil;



     if edtactDateEnd.checked then
     begin 
       if ENActIncomeTechConditionsFilterObj.actDateEnd = nil then
          ENActIncomeTechConditionsFilterObj.actDateEnd := TXSDate.Create;
       ENActIncomeTechConditionsFilterObj.actDateEnd.XSToNative(GetXSDate(edtactDateEnd.DateTime));
     end
     else
       ENActIncomeTechConditionsFilterObj.actDateEnd := nil;



     if (ENActIncomeTechConditionsFilterObj.summaGen = nil ) then
       ENActIncomeTechConditionsFilterObj.summaGen := TXSDecimal.Create;
     if edtSummaGen.Text <> '' then
       ENActIncomeTechConditionsFilterObj.summaGen.decimalString := edtSummaGen.Text 
     else
       ENActIncomeTechConditionsFilterObj.summaGen := nil;




     if (ENActIncomeTechConditionsFilterObj.summaVat = nil ) then
       ENActIncomeTechConditionsFilterObj.summaVat := TXSDecimal.Create;
     if edtSummaVat.Text <> '' then
       ENActIncomeTechConditionsFilterObj.summaVat.decimalString := edtSummaVat.Text 
     else
       ENActIncomeTechConditionsFilterObj.summaVat := nil;




     ENActIncomeTechConditionsFilterObj.commentGen := edtCommentGen.Text; 




  end;
end;




end.