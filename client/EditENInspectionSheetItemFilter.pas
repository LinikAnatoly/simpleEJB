
unit EditENInspectionSheetItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENInspectionSheetItemController ;

type
  TfrmENInspectionSheetItemFilterEdit = class(TDialogForm)

    lblDefectCode : TLabel;
    edtDefectCode: TEdit;

    lblDefectName : TLabel;
    edtDefectName: TMemo;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblIsDetecting : TLabel;
    edtIsDetecting: TEdit;

    lblCountGen : TLabel;
    edtCountGen: TEdit;

    lblCountDefects : TLabel;
    edtCountDefects: TEdit;

    lblCoefficientKi : TLabel;
    edtCoefficientKi: TEdit;

    lblPointsPi : TLabel;
    edtPointsPi: TEdit;

    lblWeightXi : TLabel;
    edtWeightXi: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENInspectionSheetItem: THTTPRIO;

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
  frmENInspectionSheetItemFilterEdit: TfrmENInspectionSheetItemFilterEdit;
  ENInspectionSheetItemFilterObj: ENInspectionSheetItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENInspectionSheetItemController  ;
}
{$R *.dfm}



procedure TfrmENInspectionSheetItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDefectCode
      ,edtDefectName
      ,edtIsDetecting
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtDefectCode.Text := ENInspectionSheetItemObj.defectCode; 



    MakeMultiline(edtDefectName.Lines, ENInspectionSheetItemObj.defectName);



    MakeMultiline(edtCommentGen.Lines, ENInspectionSheetItemObj.commentGen);



    if ( ENInspectionSheetItemObj.isDetecting <> Low(Integer) ) then
       edtIsDetecting.Text := IntToStr(ENInspectionSheetItemObj.isDetecting)
    else
       edtIsDetecting.Text := '';



    if ( ENInspectionSheetItemObj.countGen <> nil ) then
       edtCountGen.Text := ENInspectionSheetItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    if ( ENInspectionSheetItemObj.countDefects <> nil ) then
       edtCountDefects.Text := ENInspectionSheetItemObj.countDefects.decimalString
    else
       edtCountDefects.Text := ''; 



    if ( ENInspectionSheetItemObj.coefficientKi <> nil ) then
       edtCoefficientKi.Text := ENInspectionSheetItemObj.coefficientKi.decimalString
    else
       edtCoefficientKi.Text := ''; 



    if ( ENInspectionSheetItemObj.pointsPi <> nil ) then
       edtPointsPi.Text := ENInspectionSheetItemObj.pointsPi.decimalString
    else
       edtPointsPi.Text := ''; 



    if ( ENInspectionSheetItemObj.weightXi <> nil ) then
       edtWeightXi.Text := ENInspectionSheetItemObj.weightXi.decimalString
    else
       edtWeightXi.Text := ''; 



    edtUserGen.Text := ENInspectionSheetItemObj.userGen; 



      if ENInspectionSheetItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENInspectionSheetItemObj.dateEdit.Year,ENInspectionSheetItemObj.dateEdit.Month,ENInspectionSheetItemObj.dateEdit.Day);
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



procedure TfrmENInspectionSheetItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENInspectionSheetItem: ENInspectionSheetItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENInspectionSheetItemFilterObj.defectCode := edtDefectCode.Text; 



     ENInspectionSheetItemFilterObj.defectName := edtDefectName.Text; 



     ENInspectionSheetItemFilterObj.commentGen := edtCommentGen.Text; 



     if ( edtIsDetecting.Text <> '' ) then
       ENInspectionSheetItemFilterObj.isDetecting := StrToInt(edtIsDetecting.Text)
     else
       ENInspectionSheetItemFilterObj.isDetecting := Low(Integer) ;
	   



     if (ENInspectionSheetItemFilterObj.countGen = nil ) then
       ENInspectionSheetItemFilterObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENInspectionSheetItemFilterObj.countGen.decimalString := edtCountGen.Text 
     else
       ENInspectionSheetItemFilterObj.countGen := nil;




     if (ENInspectionSheetItemFilterObj.countDefects = nil ) then
       ENInspectionSheetItemFilterObj.countDefects := TXSDecimal.Create;
     if edtCountDefects.Text <> '' then
       ENInspectionSheetItemFilterObj.countDefects.decimalString := edtCountDefects.Text 
     else
       ENInspectionSheetItemFilterObj.countDefects := nil;




     if (ENInspectionSheetItemFilterObj.coefficientKi = nil ) then
       ENInspectionSheetItemFilterObj.coefficientKi := TXSDecimal.Create;
     if edtCoefficientKi.Text <> '' then
       ENInspectionSheetItemFilterObj.coefficientKi.decimalString := edtCoefficientKi.Text 
     else
       ENInspectionSheetItemFilterObj.coefficientKi := nil;




     if (ENInspectionSheetItemFilterObj.pointsPi = nil ) then
       ENInspectionSheetItemFilterObj.pointsPi := TXSDecimal.Create;
     if edtPointsPi.Text <> '' then
       ENInspectionSheetItemFilterObj.pointsPi.decimalString := edtPointsPi.Text 
     else
       ENInspectionSheetItemFilterObj.pointsPi := nil;




     if (ENInspectionSheetItemFilterObj.weightXi = nil ) then
       ENInspectionSheetItemFilterObj.weightXi := TXSDecimal.Create;
     if edtWeightXi.Text <> '' then
       ENInspectionSheetItemFilterObj.weightXi.decimalString := edtWeightXi.Text 
     else
       ENInspectionSheetItemFilterObj.weightXi := nil;




     ENInspectionSheetItemFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENInspectionSheetItemFilterObj.dateEdit = nil then
          ENInspectionSheetItemFilterObj.dateEdit := TXSDate.Create;
       ENInspectionSheetItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENInspectionSheetItemFilterObj.dateEdit := nil;




  end;
end;




end.