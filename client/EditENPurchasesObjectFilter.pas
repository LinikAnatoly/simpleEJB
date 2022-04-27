
unit EditENPurchasesObjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPurchasesObjectController ;

type
  TfrmENPurchasesObjectFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

  lblENPurchasesObjectReasonPurchasesReasonName : TLabel;
  edtENPurchasesObjectReasonPurchasesReasonName : TEdit;
  spbENPurchasesObjectReasonPurchasesReason : TSpeedButton;
  
  lblENDepartmentBudgetName : TLabel;
  edtENDepartmentBudgetName : TEdit;
  spbENDepartmentBudget : TSpeedButton;
  
  lblENDepartmentDepartmentName : TLabel;
  edtENDepartmentDepartmentName : TEdit;
  spbENDepartmentDepartment : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENPurchasesObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENPurchasesObjectReasonPurchasesReasonClick(Sender : TObject);
  procedure spbENDepartmentBudgetClick(Sender : TObject);
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPurchasesObjectFilterEdit: TfrmENPurchasesObjectFilterEdit;
  ENPurchasesObjectFilterObj: ENPurchasesObjectFilter;

implementation

uses
  ShowENPurchasesObjectReason
  ,ENPurchasesObjectReasonController
  ,ShowENDepartment
  ,ENDepartmentController
//  ,ShowENDepartment
//  ,ENDepartmentController
  ,ShowENElement
  ,ENElementController
, ENDepartmentTypeController, ENConsts, DMReportsUnit;

{uses  
    EnergyproController, EnergyproController2, ENPurchasesObjectController  ;
}
{$R *.dfm}



procedure TfrmENPurchasesObjectFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENPurchasesObjectObj.name; 



    edtCommentGen.Text := ENPurchasesObjectObj.commentGen; 


  end;

}

end;



procedure TfrmENPurchasesObjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPurchasesObject: ENPurchasesObjectControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPurchasesObjectFilterObj.name := edtName.Text; 



     ENPurchasesObjectFilterObj.commentGen := edtCommentGen.Text; 




  end;
end;

procedure TfrmENPurchasesObjectFilterEdit.spbENPurchasesObjectReasonPurchasesReasonClick(Sender : TObject);
var 
   frmENPurchasesObjectReasonShow: TfrmENPurchasesObjectReasonShow;
begin
   frmENPurchasesObjectReasonShow:=TfrmENPurchasesObjectReasonShow.Create(Application,fmNormal);
   try
      with frmENPurchasesObjectReasonShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPurchasesObjectFilterObj.purchasesReason = nil then ENPurchasesObjectFilterObj.purchasesReason := ENPurchasesObjectReason.Create();
               ENPurchasesObjectFilterObj.purchasesReason.code := StrToInt(GetReturnValue(sgENPurchasesObjectReason,0));
               edtENPurchasesObjectReasonPurchasesReasonName.Text:=GetReturnValue(sgENPurchasesObjectReason,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPurchasesObjectReasonShow.Free;
   end;
end;


procedure TfrmENPurchasesObjectFilterEdit.spbENDepartmentBudgetClick(Sender : TObject);

var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   f.conditionSQL := ' parentrefcode is null';
   
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try

      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENPurchasesObjectFilterObj.budget = nil then ENPurchasesObjectFilterObj.budget := ENDepartment.Create();
               ENPurchasesObjectFilterObj.budget.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentBudgetName.Text:=ENDepartmentShort(tvDep.Selected.Data).shortName ;
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
               if ENPurchasesObjectFilterObj.budget = nil then ENPurchasesObjectFilterObj.budget := ENDepartment.Create();
//               ENPurchasesObjectFilterObj.budget.code := StrToInt(GetReturnValue(sgENDepartment,0));
//               edtENDepartmentBudgetName.Text:=GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
   }
end;


procedure TfrmENPurchasesObjectFilterEdit.spbENDepartmentDepartmentClick(Sender : TObject);

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
               if ENPurchasesObjectFilterObj.department = nil then ENPurchasesObjectFilterObj.department := ENDepartment.Create();
               ENPurchasesObjectFilterObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
               {
               if  ENPurchasesObjectFilterObj.element = nil then  ENPurchasesObjectFilterObj.element := ENElement.Create;
               if  ENPurchasesObjectFilterObj.element.renRef = nil then ENPurchasesObjectFilterObj.element.renRef := EPRenRef.Create;
               ENPurchasesObjectFilterObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENPurchasesObjectFilterObj.department.code));
               }
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
               if ENPurchasesObjectFilterObj.department = nil then ENPurchasesObjectFilterObj.department := ENDepartment.Create();
//               ENPurchasesObjectFilterObj.department.code := StrToInt(GetReturnValue(sgENDepartment,0));
//               edtENDepartmentDepartmentName.Text:=GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;}

end;


procedure TfrmENPurchasesObjectFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPurchasesObjectFilterObj.element = nil then ENPurchasesObjectFilterObj.element := ENElement.Create();
               ENPurchasesObjectFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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