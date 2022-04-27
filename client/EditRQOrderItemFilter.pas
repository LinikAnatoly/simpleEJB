
unit EditRQOrderItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderItemController ;

type
  TfrmRQOrderItemFilterEdit = class(TDialogForm)
    lblMaterialNameTxt : TLabel;
    edtMaterialName: TEdit;

  btnOk: TButton;
  btnCancel: TButton;
    chbWithoutContracts: TCheckBox;
    lblContractNumber: TLabel;
    edtContractNumber: TEdit;
    lblENResponsibles: TLabel;
    edtENResponsibles: TEdit;
    spbENResponsibles: TSpeedButton;
    spbENResponsiblesClear: TSpeedButton;
    lblRQOrg: TLabel;
    edtRQOrg: TEdit;
    edtTypePayName: TEdit;
    spbTypePay: TSpeedButton;
    lblTypePay: TLabel;
    spbTypePayClear: TSpeedButton;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chbWithoutContractsClick(Sender: TObject);
    procedure spbENResponsiblesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENResponsiblesClearClick(Sender: TObject);
    procedure spbTypePayClick(Sender: TObject);
    procedure spbTypePayClearClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    responsibleCode: Integer;
		responsibleName: String;

		typePayCode : integer;
    budgetCode : Integer;
  end;

var
  frmRQOrderItemFilterEdit: TfrmRQOrderItemFilterEdit;
  //RQOrderItemFilterObj: RQOrderItemFilter;

implementation

uses ShowENResponsibles, ENConsts, ShowRQOrderItemTypePay, ShowENDepartment,
  ENDepartment2EPRenController, ENDepartmentController,
  ENDepartmentTypeController;

{uses
    EnergyproController, EnergyproController2, RQOrderItemController  ;
}
{$R *.dfm}



procedure TfrmRQOrderItemFilterEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtENResponsibles, edtTypePayName, edtENBudgetName]);

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtCountFact
      ,edtPriceWithoutNds
      ,edtNds
      ,edtSumWithoutNds
      ,edtSumNds
      ,edtSumGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( RQOrderItemObj.countGen <> nil ) then
       edtCountGen.Text := RQOrderItemObj.countGen.decimalString
    else
       edtCountGen.Text := '';

    edtMaterialNameTxt.Text := RQOrderItemObj.materialNameTxt;
    edtMeasurementNameTxt.Text := RQOrderItemObj.measurementNameTxt;

    if ( RQOrderItemObj.countFact <> nil ) then
       edtCountFact.Text := RQOrderItemObj.countFact.decimalString
    else
       edtCountFact.Text := '';

    if ( RQOrderItemObj.priceWithoutNds <> nil ) then
       edtPriceWithoutNds.Text := RQOrderItemObj.priceWithoutNds.decimalString
    else
       edtPriceWithoutNds.Text := '';

    if ( RQOrderItemObj.nds <> nil ) then
       edtNds.Text := RQOrderItemObj.nds.decimalString
    else
       edtNds.Text := '';

    if ( RQOrderItemObj.sumWithoutNds <> nil ) then
       edtSumWithoutNds.Text := RQOrderItemObj.sumWithoutNds.decimalString
    else
       edtSumWithoutNds.Text := '';

    if ( RQOrderItemObj.sumNds <> nil ) then
       edtSumNds.Text := RQOrderItemObj.sumNds.decimalString
    else
       edtSumNds.Text := '';

    if ( RQOrderItemObj.sumGen <> nil ) then
       edtSumGen.Text := RQOrderItemObj.sumGen.decimalString
    else
       edtSumGen.Text := '';

    edtCommentGen.Text := RQOrderItemObj.commentGen;
    edtUserGen.Text := RQOrderItemObj.userGen;

      if RQOrderItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQOrderItemObj.dateEdit.Year,RQOrderItemObj.dateEdit.Month,RQOrderItemObj.dateEdit.Day);
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



procedure TfrmRQOrderItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderItem: RQOrderItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin
{
     if (RQOrderItemFilterObj.countGen = nil ) then
       RQOrderItemFilterObj.countGen := TXSDecimal.Create;
     RQOrderItemFilterObj.countGen.decimalString := edtCountGen.Text ;

     RQOrderItemFilterObj.materialNameTxt := edtMaterialNameTxt.Text;
     RQOrderItemFilterObj.measurementNameTxt := edtMeasurementNameTxt.Text;

     if (RQOrderItemFilterObj.countFact = nil ) then
       RQOrderItemFilterObj.countFact := TXSDecimal.Create;
     RQOrderItemFilterObj.countFact.decimalString := edtCountFact.Text ;

     if (RQOrderItemFilterObj.priceWithoutNds = nil ) then
       RQOrderItemFilterObj.priceWithoutNds := TXSDecimal.Create;
     RQOrderItemFilterObj.priceWithoutNds.decimalString := edtPriceWithoutNds.Text ;

     if (RQOrderItemFilterObj.nds = nil ) then
       RQOrderItemFilterObj.nds := TXSDecimal.Create;
     RQOrderItemFilterObj.nds.decimalString := edtNds.Text ;

     if (RQOrderItemFilterObj.sumWithoutNds = nil ) then
       RQOrderItemFilterObj.sumWithoutNds := TXSDecimal.Create;
     RQOrderItemFilterObj.sumWithoutNds.decimalString := edtSumWithoutNds.Text ;

     if (RQOrderItemFilterObj.sumNds = nil ) then
       RQOrderItemFilterObj.sumNds := TXSDecimal.Create;
     RQOrderItemFilterObj.sumNds.decimalString := edtSumNds.Text ;

     if (RQOrderItemFilterObj.sumGen = nil ) then
       RQOrderItemFilterObj.sumGen := TXSDecimal.Create;
     RQOrderItemFilterObj.sumGen.decimalString := edtSumGen.Text ;

     RQOrderItemFilterObj.commentGen := edtCommentGen.Text;
     RQOrderItemFilterObj.userGen := edtUserGen.Text;

     if RQOrderItemFilterObj.dateEdit = nil then
        RQOrderItemFilterObj.dateEdit := TXSDate.Create;
      RQOrderItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));

}
  end;
end;


procedure TfrmRQOrderItemFilterEdit.chbWithoutContractsClick(
  Sender: TObject);
begin
  if chbWithoutContracts.Checked then
    edtContractNumber.Text := '';
  HideControls([lblContractNumber, edtContractNumber], chbWithoutContracts.Checked);
end;

procedure TfrmRQOrderItemFilterEdit.spbENResponsiblesClick(
  Sender: TObject);
var
  frmENResponsiblesShow: TfrmENResponsiblesShow;
begin
  frmENResponsiblesShow := TfrmENResponsiblesShow.Create(Application, fmNormal);
  try
    frmENResponsiblesShow.DisableActions([frmENResponsiblesShow.actInsert,
                                          frmENResponsiblesShow.actEdit,
                                          frmENResponsiblesShow.actDelete]);
    with frmENResponsiblesShow do
      if ShowModal = mrOk then
      begin
        try
          //if ENResponsibles2FINContractsObj.responsiblesRef = nil then ENResponsibles2FINContractsObj.responsiblesRef := ENResponsiblesRef.Create();
          //ENResponsibles2FINContractsObj.responsiblesRef.code := StrToInt(GetReturnValue(sgENResponsibles,0));
          responsibleCode := StrToInt(GetReturnValue(sgENResponsibles, 0));
          responsibleName := GetReturnValue(sgENResponsibles, 1);
          edtENResponsibles.Text := GetReturnValue(sgENResponsibles, 1);
        except
          on EConvertError do Exit;
        end;
     end;
  finally
    frmENResponsiblesShow.Free;
  end;
end;

procedure TfrmRQOrderItemFilterEdit.FormCreate(Sender: TObject);
begin
  responsibleCode := LOW_INT;
  responsibleName := '';
end;

procedure TfrmRQOrderItemFilterEdit.spbENBudgetClearClick(Sender: TObject);
begin
  inherited;
  edtENBudgetName.Text := '';
  budgetCode := LOW_INT;
end;

procedure TfrmRQOrderItemFilterEdit.spbENBudgetClick(Sender: TObject);
var
  frmENDepartmentShow : TfrmENDepartmentShow;
  f : ENDepartmentFilter;
begin
  inherited;
  f := ENDepartmentFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.typeRef := ENDepartmentTypeRef.Create;
  f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
  f.conditionSQL := ' parentrefcode is null';

  frmENDepartmentShow := TfrmENDepartmentShow.Create(Application,fmNormal, f);
  try
  with frmENDepartmentShow do begin
    if ShowModal = mrOk then
    begin
      try
        budgetCode := ENDepartmentShort(tvDep.Selected.Data).code;
        edtENBudgetName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
      except
        on EConvertError do Exit;
      end;
    end;
  end;
  finally
    frmENDepartmentShow.Free;
  end;
end;

procedure TfrmRQOrderItemFilterEdit.spbENResponsiblesClearClick(
  Sender: TObject);
begin
  responsibleCode := LOW_INT;
  responsibleName := '';
  edtENResponsibles.Text := '';
end;

procedure TfrmRQOrderItemFilterEdit.spbTypePayClick(Sender: TObject);
var
	 frmRQOrderItemTypePayShow :  TfrmRQOrderItemTypePayShow;
begin
	 frmRQOrderItemTypePayShow:=TfrmRQOrderItemTypePayShow.Create(Application,fmNormal);
	 try
			with frmRQOrderItemTypePayShow do
				if ShowModal = mrOk then
				begin
						try
							 typePayCode := StrToInt(GetReturnValue(sgRQOrderItemTypePay,0));
							 edtTypePayName.Text:=GetReturnValue(sgRQOrderItemTypePay,1);
						except
               on EConvertError do Exit;
						end;
        end;
   finally
			frmRQOrderItemTypePayShow.Free;
   end;
end;

procedure TfrmRQOrderItemFilterEdit.spbTypePayClearClick(Sender: TObject);
begin
  typePayCode := LOW_INT;
  edtTypePayName.Text := '';
  budgetCode := LOW_INT;
end;

end.
