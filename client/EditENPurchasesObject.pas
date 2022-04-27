
unit EditENPurchasesObject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPurchasesObjectController ;

type
  TfrmENPurchasesObjectEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

  lblENPurchasesObjectReasonPurchasesReasonName : TLabel;
  edtENPurchasesObjectReasonPurchasesReasonName : TEdit;
  spbENPurchasesObjectReasonPurchasesReason : TSpeedButton;
  
  lblENDepartmentBudgetName : TLabel;
  edtENDepartmentBudgetName : TEdit;
  spbENDepartmentBudget : TSpeedButton;
    lblENDepartmentDepartmentName: TLabel;
  edtENDepartmentDepartmentName : TEdit;
  spbENDepartmentDepartment : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENPurchasesObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblElementType: TLabel;
    cbElementType: TComboBox;
    HTTPRIOENElementType: THTTPRIO;
    chkexpandMaterialsIP: TCheckBox;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENPurchasesObjectReasonPurchasesReasonClick(Sender : TObject);
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
  frmENPurchasesObjectEdit: TfrmENPurchasesObjectEdit;
  ENPurchasesObjectObj: ENPurchasesObject;

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
, ENDepartmentTypeController, ENConsts, ENElementTypeController,
  DMReportsUnit, ShowENGeographicDepartment, ENGeographicDepartmentController;

{uses  
    EnergyproController, EnergyproController2, ENPurchasesObjectController  ;
}
{$R *.dfm}



procedure TfrmENPurchasesObjectEdit.FormShow(Sender: TObject);
var TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
 f : ENElementTypeFilter;
 i, j : Integer;
 eTypeName : String;

  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
begin

  eTypeName:= '';

  cbElementType.Clear;

  f:= ENElementTypeFilter.Create;
  SetNullIntProps(f);
  //f.conditionSQL := 'code in (1,2,3,5,6,7,8,9,10,11)';
  //f.conditionSQL := 'code <> 4';
  //f.orderBySQL := 'code';

  // !!!!!!!!!!!!!!!
  
  f.code := ENPurchasesObjectObj.elementTypeRef.code;

  TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
  ENElementTypeList := TempENElementType.getScrollableFilteredList(f,0,-1);

  for i:=0 to ENElementTypeList.totalCount-1 do
  begin
    cbElementType.Items.AddObject(ENElementTypeList.list[i].name, TObject(ENElementTypeList.list[i].code));
    if  (ENPurchasesObjectObj.elementTypeRef.code) = ENElementTypeList.list[i].code then
      eTypeName := 'Закупівлі для Об''єктів '  + ENElementTypeList.list[i].name;
  end;

  cbElementType.DropDownCount := ENElementTypeList.totalCount + 1;


  Self.Caption := eTypeName;

  cbElementType.ItemIndex := 0;

  DisableControls([cbElementType, edtENPurchasesObjectReasonPurchasesReasonName,
                   edtENDepartmentBudgetName, edtENDepartmentDepartmentName , edtGeograph ]);
{
  try
      for j:=0 to cbElementType.Items.Count -1 do
      begin
          if Integer(cbElementType.Items.Objects[j]) =
      end;
  except
      exit;
  end;
}

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName,
      edtENPurchasesObjectReasonPurchasesReasonName,
      edtENDepartmentBudgetName,
      edtENDepartmentDepartmentName
     ]);
   end;
   if DialogState = dsView then
     DisableControls( [chkexpandMaterialsIP , btnGeograph , btnGeographClear ]);



   if DialogState = dsInsert then
     chkexpandMaterialsIP.checked:= True;


  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ENPurchasesObjectObj.element.geoDepartmentRef <> nil then
      if ENPurchasesObjectObj.element.geoDepartmentRef.code <> LOW_INT then
       begin
           // geodept
          TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
        try
          ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENPurchasesObjectObj.element.geoDepartmentRef.code );
          edtGeograph.Text := ENGeographicDepartmentObj.name;
        except
          on EConvertError do Exit;
        end;
       end;

    edtName.Text := ENPurchasesObjectObj.name;
    MakeMultiline(edtCommentGen.Lines, ENPurchasesObjectObj.commentGen);

    edtENPurchasesObjectReasonPurchasesReasonName.Text := ENPurchasesObjectObj.purchasesReason.name;
    edtENDepartmentBudgetName.Text := ENPurchasesObjectObj.budget.name;
    edtENDepartmentDepartmentName.Text := ENPurchasesObjectObj.department.name;
//    edtENElementElementName.Text := ENPurchasesObjectObj.element.name;
    if ((ENPurchasesObjectObj.expandMaterialsIP = Low(integer))
      or  (ENPurchasesObjectObj.expandMaterialsIP = 0 ))
    then
    chkexpandMaterialsIP.Checked:= False
    else
    chkexpandMaterialsIP.Checked:= True;

  end;
end;



procedure TfrmENPurchasesObjectEdit.btnGeographClearClick(Sender: TObject);
begin
    ENPurchasesObjectObj.element.geoDepartmentRef.code := LOW_INT;
    edtGeograph.Text := '';

end;

procedure TfrmENPurchasesObjectEdit.btnGeographClick(Sender: TObject);
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
                 ENPurchasesObjectObj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENPurchasesObjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPurchasesObject: ENPurchasesObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName,
      edtENPurchasesObjectReasonPurchasesReasonName,
      edtENDepartmentBudgetName,
      edtENDepartmentDepartmentName      
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENPurchasesObject := HTTPRIOENPurchasesObject as ENPurchasesObjectControllerSoapPort;


     ENPurchasesObjectObj.name := edtName.Text; 

     ENPurchasesObjectObj.commentGen := edtCommentGen.Text;


     ENPurchasesObjectObj.department.dateStart := nil;
     ENPurchasesObjectObj.department.dateFinal := nil;

     if chkexpandMaterialsIP.checked then
        ENPurchasesObjectObj.expandMaterialsIP := 1
      else
        ENPurchasesObjectObj.expandMaterialsIP := 0;

    if DialogState = dsInsert then
    begin
      ENPurchasesObjectObj.code:=low(Integer);
      TempENPurchasesObject.add(ENPurchasesObjectObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPurchasesObject.save(ENPurchasesObjectObj);
    end;
  end;
end;


procedure TfrmENPurchasesObjectEdit.spbENPurchasesObjectReasonPurchasesReasonClick(Sender : TObject);
var 
   frmENPurchasesObjectReasonShow: TfrmENPurchasesObjectReasonShow;
begin
   frmENPurchasesObjectReasonShow:=TfrmENPurchasesObjectReasonShow.Create(Application,fmNormal);
   try
      with frmENPurchasesObjectReasonShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPurchasesObjectObj.purchasesReason = nil then ENPurchasesObjectObj.purchasesReason := ENPurchasesObjectReason.Create();
               ENPurchasesObjectObj.purchasesReason.code := StrToInt(GetReturnValue(sgENPurchasesObjectReason,0));
               edtENPurchasesObjectReasonPurchasesReasonName.Text:=GetReturnValue(sgENPurchasesObjectReason,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPurchasesObjectReasonShow.Free;
   end;
end;



procedure TfrmENPurchasesObjectEdit.spbENDepartmentBudgetClick(Sender : TObject);
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
               if ENPurchasesObjectObj.budget = nil then ENPurchasesObjectObj.budget := ENDepartment.Create();
               ENPurchasesObjectObj.budget.code := ENDepartmentShort(tvDep.Selected.Data).code;
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
               if ENPurchasesObjectObj.budget = nil then ENPurchasesObjectObj.budget := ENDepartment.Create();
//               ENPurchasesObjectObj.budget.code := StrToInt(GetReturnValue(sgENDepartment,0));
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



procedure TfrmENPurchasesObjectEdit.spbENDepartmentDepartmentClick(Sender : TObject);
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
               if ENPurchasesObjectObj.department = nil then ENPurchasesObjectObj.department := ENDepartment.Create();
               ENPurchasesObjectObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
               if  ENPurchasesObjectObj.element = nil then  ENPurchasesObjectObj.element := ENElement.Create;
               if  ENPurchasesObjectObj.element.renRef = nil then ENPurchasesObjectObj.element.renRef := EPRenRef.Create;
               ENPurchasesObjectObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENPurchasesObjectObj.department.code));
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
               if ENPurchasesObjectObj.department = nil then ENPurchasesObjectObj.department := ENDepartment.Create();
//               ENPurchasesObjectObj.department.code := StrToInt(GetReturnValue(sgENDepartment,0));
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



procedure TfrmENPurchasesObjectEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPurchasesObjectObj.element = nil then ENPurchasesObjectObj.element := ENElement.Create();
               ENPurchasesObjectObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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