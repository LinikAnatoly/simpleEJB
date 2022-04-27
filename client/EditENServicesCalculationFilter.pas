
unit EditENServicesCalculationFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServicesObjectController ;

type
  TfrmENServicesCalculationFilterEdit = class(TDialogForm)

    lblContractNumber : TLabel;
    edtContractNumber: TEdit;
    lblContractDate : TLabel;
    edtContractDate: TDateTimePicker;
    lblName : TLabel;
    edtName: TEdit;
    lblPartnerCode : TLabel;
    edtPartnerCode: TEdit;
    lblFinDocCode : TLabel;
    edtFinDocCode: TEdit;
    lblFinDocID : TLabel;
    edtFinDocID: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

  lblENDepartmentDepartmentName : TLabel;
  edtENDepartmentDepartmentName : TEdit;
  spbENDepartmentDepartment : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENServicesObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENServicesCalculationFilterEdit: TfrmENServicesCalculationFilterEdit;
  ENServicesObjectFilterObj: ENServicesObjectFilter;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
  ,ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENServicesObjectController  ;
}
{$R *.dfm}



procedure TfrmENServicesCalculationFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtContractNumber
      ,edtContractDate
      ,edtName
      ,edtPartnerCode
      ,edtFinDocCode
      ,edtFinDocID
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtContractNumber.Text := ENServicesObjectObj.contractNumber; 



      if ENServicesObjectObj.contractDate <> nil then
      begin
        edtContractDate.DateTime:=EncodeDate(ENServicesObjectObj.contractDate.Year,ENServicesObjectObj.contractDate.Month,ENServicesObjectObj.contractDate.Day);
        edtContractDate.checked := true;
      end
      else
      begin
        edtContractDate.DateTime:=SysUtils.Date;
        edtContractDate.checked := false;
      end;



    edtName.Text := ENServicesObjectObj.name; 



    edtPartnerCode.Text := ENServicesObjectObj.partnerCode; 



    edtFinDocCode.Text := ENServicesObjectObj.finDocCode; 



    if ( ENServicesObjectObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENServicesObjectObj.finDocID)
    else
       edtFinDocID.Text := '';



    edtCommentGen.Text := ENServicesObjectObj.commentGen; 



    edtUserGen.Text := ENServicesObjectObj.userGen; 



      if ENServicesObjectObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENServicesObjectObj.dateEdit.Year,ENServicesObjectObj.dateEdit.Month,ENServicesObjectObj.dateEdit.Day);
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



procedure TfrmENServicesCalculationFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENServicesObjectFilterObj.contractNumber := edtContractNumber.Text; 



     if edtcontractDate.checked then
     begin 
       if ENServicesObjectFilterObj.contractDate = nil then
          ENServicesObjectFilterObj.contractDate := TXSDate.Create;
       ENServicesObjectFilterObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end
     else
       ENServicesObjectFilterObj.contractDate := nil;




     ENServicesObjectFilterObj.name := edtName.Text; 



     ENServicesObjectFilterObj.partnerCode := edtPartnerCode.Text; 


     {
     ENServicesObjectFilterObj.finDocCode := edtFinDocCode.Text; 



     if ( edtFinDocID.Text <> '' ) then
       ENServicesObjectFilterObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       ENServicesObjectFilterObj.finDocID := Low(Integer) ;




     ENServicesObjectFilterObj.commentGen := edtCommentGen.Text; 



     //ENServicesObjectFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENServicesObjectFilterObj.dateEdit = nil then
          ENServicesObjectFilterObj.dateEdit := TXSDate.Create;
       ENServicesObjectFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENServicesObjectFilterObj.dateEdit := nil;

      }



  end;
end;

procedure TfrmENServicesCalculationFilterEdit.spbENDepartmentDepartmentClick(Sender : TObject);
var 
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin

  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   //f.typeRef := ENDepartmentTypeRef.Create;
   //f.typeRef.code := 0; // предприятие ХОЕ ... ENDEPARTMENTTYPE_DEPARTMENT;
   //f.conditionSQL := ' parentrefcode is null';
   //f.conditionSQL :=

   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENServicesObjectFilterObj.department = nil then ENServicesObjectFilterObj.department := ENDepartment.Create();
               ENServicesObjectFilterObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

{
var 
   frmENDepartmentShow: TfrmENDepartmentShow;
begin
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesObjectFilterObj.department = nil then ENServicesObjectFilterObj.department := ENDepartment.Create();
               //ENServicesObjectFilterObj.department.code := StrToInt(GetReturnValue(sgENDepartment,0));
               //edtENDepartmentDepartmentName.Text:=GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
}
end;


procedure TfrmENServicesCalculationFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesObjectFilterObj.element = nil then ENServicesObjectFilterObj.element := ENElement.Create();
               ENServicesObjectFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;





end.