
unit EditENInvestProgramFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENInvestProgramController ;

type
  TfrmENInvestProgramFilterEdit = class(TDialogForm)

  btnOk: TButton;
  btnCancel: TButton;
    lblYearGen: TLabel;
    cbYearGen: TComboBox;
    lblEnElement: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    Label3: TLabel;
    edtInvNumber: TEdit;
    lbPlanlTypeName: TLabel;
    edtPlanTypeName: TEdit;
    spbPlanType: TSpeedButton;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    lblInvestProgramGroupsName: TLabel;
    edtInvestProgramGroupsName: TEdit;
    spbInvestProgramGroups: TSpeedButton;
    lblItemNumber: TLabel;
    edtItemNumber: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENElementClick(Sender: TObject);
    procedure spbPlanTypeClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbInvestProgramGroupsClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENInvestProgramFilterEdit: TfrmENInvestProgramFilterEdit;
  ENInvestProgramFilterObj: ENInvestProgramFilter;

implementation

uses
  ShowTKMeasurement
  ,TKMeasurementController
, ShowENElement, ENElementController, ShowENPlanWorkType, ENConsts,
  ENPlanWorkTypeController, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController, ShowENInvestProgramGroups,
  ENInvestProgramGroupsController;

{uses  
    EnergyproController, EnergyproController2, ENInvestProgramController  ;
}
{$R *.dfm}



procedure TfrmENInvestProgramFilterEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtENElementName, edtInvNumber, edtENBudgetName, edtPlanTypeName, edtInvestProgramGroupsName]);

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtYearGen
      ,edtCountGen
      ,edtPrice
      ,edtSumGen
      ,edtQuarter1count
      ,edtQuarter1sum
      ,edtQuarter2count
      ,edtQuarter2sum
      ,edtQuarter3count
      ,edtQuarter3sum
      ,edtQuarter4count
      ,edtQuarter4sum
      ,edtUserAdd
      ,edtDateAdd
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENInvestProgramObj.name; 



    if ( ENInvestProgramObj.yearGen <> Low(Integer) ) then
       edtYearGen.Text := IntToStr(ENInvestProgramObj.yearGen)
    else
       edtYearGen.Text := '';



    MakeMultiline(edtCommentGen.Lines, ENInvestProgramObj.commentGen);



    if ( ENInvestProgramObj.countGen <> nil ) then
       edtCountGen.Text := ENInvestProgramObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    if ( ENInvestProgramObj.price <> nil ) then
       edtPrice.Text := ENInvestProgramObj.price.decimalString
    else
       edtPrice.Text := ''; 



    if ( ENInvestProgramObj.sumGen <> nil ) then
       edtSumGen.Text := ENInvestProgramObj.sumGen.decimalString
    else
       edtSumGen.Text := ''; 



    if ( ENInvestProgramObj.quarter1count <> nil ) then
       edtQuarter1count.Text := ENInvestProgramObj.quarter1count.decimalString
    else
       edtQuarter1count.Text := ''; 



    if ( ENInvestProgramObj.quarter1sum <> nil ) then
       edtQuarter1sum.Text := ENInvestProgramObj.quarter1sum.decimalString
    else
       edtQuarter1sum.Text := ''; 



    if ( ENInvestProgramObj.quarter2count <> nil ) then
       edtQuarter2count.Text := ENInvestProgramObj.quarter2count.decimalString
    else
       edtQuarter2count.Text := ''; 



    if ( ENInvestProgramObj.quarter2sum <> nil ) then
       edtQuarter2sum.Text := ENInvestProgramObj.quarter2sum.decimalString
    else
       edtQuarter2sum.Text := ''; 



    if ( ENInvestProgramObj.quarter3count <> nil ) then
       edtQuarter3count.Text := ENInvestProgramObj.quarter3count.decimalString
    else
       edtQuarter3count.Text := ''; 



    if ( ENInvestProgramObj.quarter3sum <> nil ) then
       edtQuarter3sum.Text := ENInvestProgramObj.quarter3sum.decimalString
    else
       edtQuarter3sum.Text := ''; 



    if ( ENInvestProgramObj.quarter4count <> nil ) then
       edtQuarter4count.Text := ENInvestProgramObj.quarter4count.decimalString
    else
       edtQuarter4count.Text := ''; 



    if ( ENInvestProgramObj.quarter4sum <> nil ) then
       edtQuarter4sum.Text := ENInvestProgramObj.quarter4sum.decimalString
    else
       edtQuarter4sum.Text := ''; 



    edtUserAdd.Text := ENInvestProgramObj.userAdd; 



      if ENInvestProgramObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(ENInvestProgramObj.dateAdd.Year,ENInvestProgramObj.dateAdd.Month,ENInvestProgramObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



    edtUserGen.Text := ENInvestProgramObj.userGen; 



      if ENInvestProgramObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENInvestProgramObj.dateEdit.Year,ENInvestProgramObj.dateEdit.Month,ENInvestProgramObj.dateEdit.Day);
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



procedure TfrmENInvestProgramFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
// var TempENInvestProgram: ENInvestProgramControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin
    if (cbYearGen.ItemIndex >= 1) then
      ENInvestProgramFilterObj.yearGen := cbYearGen.ItemIndex + 2012
    else
      ENInvestProgramFilterObj.yearGen := Low(Integer);

    ENInvestProgramFilterObj.itemNumber := edtItemNumber.Text;
  end;
end;

procedure TfrmENInvestProgramFilterEdit.spbENBudgetClick(Sender: TObject);
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
               if ENInvestProgramFilterObj.budgetRef = nil then ENInvestProgramFilterObj.budgetRef := ENDepartmentRef.Create();
               ENInvestProgramFilterObj.budgetRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENBudgetName.Text:=ENDepartmentShort(tvDep.Selected.Data).shortName ;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENInvestProgramFilterEdit.spbENElementClick(Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.orderBySQL := 'typerefcode';

  frmENElementShow := TfrmENElementShow.Create(Application, fmNormal, f);

  try
    DisableActions([frmENElementShow.actInsert, frmENElementShow.actEdit, frmENElementShow.actDelete]);

    with frmENElementShow do
      if ShowModal = mrOk then
      begin
        try
          if ENInvestProgramFilterObj.elementRef = nil then ENInvestProgramFilterObj.elementRef := ENElementRef.Create();
          ENInvestProgramFilterObj.elementRef.code := StrToInt(GetReturnValue(sgENElement, 0));
          edtENElementName.Text := GetReturnValue(sgENElement, 1);
          edtInvNumber.Text := GetReturnValue(sgENElement, 3);
        except
          on EConvertError do Exit;
        end;
      end;
   finally
     frmENElementShow.Free;
   end;
end;

procedure TfrmENInvestProgramFilterEdit.spbInvestProgramGroupsClick(
  Sender: TObject);
var
   frmENInvestProgramGroupsShow: TfrmENInvestProgramGroupsShow;
   //f : ENInvestProgramGroupsFilter;
begin
   {
   f := ENInvestProgramGroupsFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   }

   //frmENInvestProgramGroupsShow := TfrmENInvestProgramGroupsShow.Create(Application, fmNormal, f);
   frmENInvestProgramGroupsShow := TfrmENInvestProgramGroupsShow.Create(Application, fmNormal);
   try
     DisableActions([frmENInvestProgramGroupsShow.actInsert, frmENInvestProgramGroupsShow.actEdit, frmENInvestProgramGroupsShow.actDelete]);

     with frmENInvestProgramGroupsShow do
     begin
       if ShowModal = mrOk then
       begin
         try
           if ENInvestProgramFilterObj.invGroupRef = nil then ENInvestProgramFilterObj.invGroupRef := ENInvestProgramGroupsRef.Create();
           ENInvestProgramFilterObj.invGroupRef.code := StrToInt(GetReturnValue(sgENInvestProgramGroups, 0));
           edtInvestProgramGroupsName.Text := GetReturnValue(sgENInvestProgramGroups, 1) + '. ' +
                                              GetReturnValue(sgENInvestProgramGroups, 2);
         except
           on EConvertError do Exit;
         end;
       end;
     end;
   finally
     frmENInvestProgramGroupsShow.Free;
   end;
end;

procedure TfrmENInvestProgramFilterEdit.spbPlanTypeClick(Sender: TObject);
var
   frmENPlanWorkTypeShow: TfrmENPlanWorkTypeShow;
   f: ENPlanWorkTypeFilter;
   element: ENElement;
begin
  /////
  f := ENPlanWorkTypeFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.conditionSQL := 'code in (' + IntToStr(ENPLANWORKTYPE_INVEST) + ', ' +
                                  IntToStr(ENPLANWORKTYPE_SERVICES_FROM_SIDE_INVEST) + ', ' +
                                  IntToStr(ENPLANWORKTYPE_ESBYT_PZ) + ', ' +
                                  IntToStr(ENPLANWORKTYPE_ESBYT_ZKO_106) + ', ' +
                                  IntToStr(ENPLANWORKTYPE_ESBYT_ZKO_111) + ', ' +
                                  IntToStr(ENPLANWORKTYPE_ESBYT_ZKO_112) + ')';
  /////

  frmENPlanWorkTypeShow := TfrmENPlanWorkTypeShow.Create(Application, fmNormal, f);
  try
    DisableActions([frmENPlanWorkTypeShow.actInsert, frmENPlanWorkTypeShow.actEdit, frmENPlanWorkTypeShow.actDelete,
                    frmENPlanWorkTypeShow.actFilter, frmENPlanWorkTypeShow.actNoFilter]);

    with frmENPlanWorkTypeShow do
    begin
      //DisableActions([actEdit, actInsert, actDelete]);
      if ShowModal = mrOk then
      begin
        try
          if ENInvestProgramFilterObj.planTypeRef = nil then ENInvestProgramFilterObj.planTypeRef := ENPlanWorkTypeRef.Create();
          ENInvestProgramFilterObj.planTypeRef.code := StrToInt(GetReturnValue(sgENPlanWorkType, 0));
          edtPlanTypeName.Text := GetReturnValue(sgENPlanWorkType, 1);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENPlanWorkTypeShow.Free;
  end;
end;

end.
