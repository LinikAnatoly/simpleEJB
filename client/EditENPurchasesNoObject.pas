
unit EditENPurchasesNoObject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPurchasesNoObjectController ;

type
  TfrmENPurchasesNoObjectEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

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
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentBudgetClick(Sender : TObject);
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPurchasesNoObjectEdit: TfrmENPurchasesNoObjectEdit;
  ENPurchasesNoObjectObj: ENPurchasesNoObject;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
  //,ShowENDepartment
  //,ENDepartmentController
  ,ShowENElement
  ,ENElementController
, DMReportsUnit, ENDepartmentTypeController, ENConsts,
  ENGeographicDepartmentController, ShowENGeographicDepartment;

{uses  
    EnergyproController, EnergyproController2, ENPurchasesNoObjectController  ;
}
{$R *.dfm}



procedure TfrmENPurchasesNoObjectEdit.FormShow(Sender: TObject);
var
TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtENDepartmentBudgetName,
                     edtENDepartmentDepartmentName , edtGeograph ]);

    DenyBlankValues([
      edtName,
      edtENDepartmentBudgetName,
      edtENDepartmentDepartmentName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ENPurchasesNoObjectObj.element.geoDepartmentRef <> nil then
      if ENPurchasesNoObjectObj.element.geoDepartmentRef.code <> LOW_INT then
       begin
             // geodept
            TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
          try
            ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENPurchasesNoObjectObj.element.geoDepartmentRef.code );
            edtGeograph.Text := ENGeographicDepartmentObj.name;
          except
            on EConvertError do Exit;
          end;
       end;

    edtName.Text := ENPurchasesNoObjectObj.name; 
    MakeMultiline(edtCommentGen.Lines, ENPurchasesNoObjectObj.commentGen);

    edtENDepartmentBudgetName.Text := ENPurchasesNoObjectObj.budget.name;
    edtENDepartmentDepartmentName.Text := ENPurchasesNoObjectObj.department.name;
    //edtENElementElementName.Text := ENPurchasesNoObjectObj.element.name;

  end;

  if (DialogState = dsview) then
    DisableControls([edtGeograph, btnGeograph , btnGeographClear]);
end;



procedure TfrmENPurchasesNoObjectEdit.btnGeographClearClick(Sender: TObject);
begin
  ENPurchasesNoObjectObj.element.geoDepartmentRef.code := LOW_INT;
   edtGeograph.Text := '';

end;

procedure TfrmENPurchasesNoObjectEdit.btnGeographClick(Sender: TObject);
var
   frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
   Filter : ENGeographicDepartmentFilter;
   selected : ENGeographicDepartmentShort;
begin
  Filter := ENGeographicDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);


  frmENGeographicDepartmentShow := TfrmENGeographicDepartmentShow.Create(Application, fmNormal, Filter);
  try
      with frmENGeographicDepartmentShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENGeographicDepartmentShort(sgENGeographicDepartment.Objects[0, sgENGeographicDepartment.Row]);
                except
                   on EConvertError do begin  Exit; end;
                end;
                 ENPurchasesNoObjectObj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENPurchasesNoObjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPurchasesNoObject: ENPurchasesNoObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName,
      edtENDepartmentBudgetName,
      edtENDepartmentDepartmentName      
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENPurchasesNoObject := HTTPRIOENPurchasesNoObject as ENPurchasesNoObjectControllerSoapPort;


     ENPurchasesNoObjectObj.name := edtName.Text; 

     ENPurchasesNoObjectObj.commentGen := edtCommentGen.Text;

     ENPurchasesNoObjectObj.department.dateStart := nil;
     ENPurchasesNoObjectObj.department.dateFinal := nil;

    if DialogState = dsInsert then
    begin
      ENPurchasesNoObjectObj.code:=low(Integer);
      TempENPurchasesNoObject.add(ENPurchasesNoObjectObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPurchasesNoObject.save(ENPurchasesNoObjectObj);
    end;
  end;
end;


procedure TfrmENPurchasesNoObjectEdit.spbENDepartmentBudgetClick(Sender : TObject);
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
               if ENPurchasesNoObjectObj.budget = nil then ENPurchasesNoObjectObj.budget := ENDepartment.Create();
               ENPurchasesNoObjectObj.budget.code := ENDepartmentShort(tvDep.Selected.Data).code;
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
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPurchasesNoObjectObj.budget = nil then ENPurchasesNoObjectObj.budget := ENDepartment.Create();
//               ENPurchasesNoObjectObj.budget.code := StrToInt(GetReturnValue(sgENDepartment,0));
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



procedure TfrmENPurchasesNoObjectEdit.spbENDepartmentDepartmentClick(Sender : TObject);
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
               if ENPurchasesNoObjectObj.department = nil then ENPurchasesNoObjectObj.department := ENDepartment.Create();
               ENPurchasesNoObjectObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
               if  ENPurchasesNoObjectObj.element = nil then  ENPurchasesNoObjectObj.element := ENElement.Create;
               if  ENPurchasesNoObjectObj.element.renRef = nil then ENPurchasesNoObjectObj.element.renRef := EPRenRef.Create;
               ENPurchasesNoObjectObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENPurchasesNoObjectObj.department.code));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;


{
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPurchasesNoObjectObj.department = nil then ENPurchasesNoObjectObj.department := ENDepartment.Create();
//               ENPurchasesNoObjectObj.department.code := StrToInt(GetReturnValue(sgENDepartment,0));
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



procedure TfrmENPurchasesNoObjectEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPurchasesNoObjectObj.element = nil then ENPurchasesNoObjectObj.element := ENElement.Create();
               ENPurchasesNoObjectObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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