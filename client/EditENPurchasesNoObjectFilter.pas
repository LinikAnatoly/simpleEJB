
unit EditENPurchasesNoObjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPurchasesNoObjectController ;

type
  TfrmENPurchasesNoObjectFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

  lblENDepartmentBudgetName : TLabel;
  edtENDepartmentBudgetName : TEdit;
  spbENDepartmentBudget : TSpeedButton;
  
  lblENDepartmentDepartmentName : TLabel;
  edtENDepartmentDepartmentName : TEdit;
  spbENDepartmentDepartment : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENPurchasesNoObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentBudgetClick(Sender : TObject);
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPurchasesNoObjectFilterEdit: TfrmENPurchasesNoObjectFilterEdit;
  ENPurchasesNoObjectFilterObj: ENPurchasesNoObjectFilter;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
//  ,ShowENDepartment
//  ,ENDepartmentController
  ,ShowENElement
  ,ENElementController
, ENDepartmentTypeController, ENConsts;

{uses  
    EnergyproController, EnergyproController2, ENPurchasesNoObjectController  ;
}
{$R *.dfm}



procedure TfrmENPurchasesNoObjectFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENPurchasesNoObjectObj.name; 



    edtCommentGen.Text := ENPurchasesNoObjectObj.commentGen; 


  end;

}

end;



procedure TfrmENPurchasesNoObjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPurchasesNoObject: ENPurchasesNoObjectControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPurchasesNoObjectFilterObj.name := edtName.Text; 



     ENPurchasesNoObjectFilterObj.commentGen := edtCommentGen.Text; 




  end;
end;

procedure TfrmENPurchasesNoObjectFilterEdit.spbENDepartmentBudgetClick(Sender : TObject);
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
               if ENPurchasesNoObjectFilterObj.budget = nil then ENPurchasesNoObjectFilterObj.budget := ENDepartment.Create();
               ENPurchasesNoObjectFilterObj.budget.code := ENDepartmentShort(tvDep.Selected.Data).code;
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
               if ENPurchasesNoObjectFilterObj.budget = nil then ENPurchasesNoObjectFilterObj.budget := ENDepartment.Create();
//               ENPurchasesNoObjectFilterObj.budget.code := StrToInt(GetReturnValue(sgENDepartment,0));
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


procedure TfrmENPurchasesNoObjectFilterEdit.spbENDepartmentDepartmentClick(Sender : TObject);
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
               if ENPurchasesNoObjectFilterObj.department = nil then ENPurchasesNoObjectFilterObj.department := ENDepartment.Create();
               ENPurchasesNoObjectFilterObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
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
               if ENPurchasesNoObjectFilterObj.department = nil then ENPurchasesNoObjectFilterObj.department := ENDepartment.Create();
//               ENPurchasesNoObjectFilterObj.department.code := StrToInt(GetReturnValue(sgENDepartment,0));
//               edtENDepartmentDepartmentName.Text:=GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
}
end;


procedure TfrmENPurchasesNoObjectFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPurchasesNoObjectFilterObj.element = nil then ENPurchasesNoObjectFilterObj.element := ENElement.Create();
               ENPurchasesNoObjectFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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