
unit EditENServicesObjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,     
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENServicesObjectController, ExtCtrls
  , Generics.Collections, ENServicesContragentTypeController;

type
    TfrmENServicesObjectFilterEdit = class(TDialogForm)
    lblName : TLabel;
    edtContragentName: TEdit;

    lblContractNumberServices : TLabel;
    edtContractNumberServices: TEdit;

    lblContractDateServices : TLabel;
  

  HTTPRIOENServicesObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtContractDateServicesFrom: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    cbContractStatus: TComboBox;
    cbStatus: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    edtContractDateServicesTo: TDateTimePicker;
    lblContragentOkpo: TLabel;
    edtContragentOkpo: TEdit;
    GroupBox1: TGroupBox;
    lblContractNumber: TLabel;
    edtContractNumber: TEdit;
    lblContractDate: TLabel;
    Label5: TLabel;
    edtContractDateFrom: TDateTimePicker;
    Label6: TLabel;
    edtContractDateTo: TDateTimePicker;
    lblPartnerCode: TLabel;
    lblFinDocCode: TLabel;
    lblFinDocID: TLabel;
    lblCommentGen: TLabel;
    edtPartnerCode: TEdit;
    edtFinDocCode: TEdit;
    edtFinDocID: TEdit;
    edtCommentGen: TEdit;
    lblENDepartmentDepartmentName: TLabel;
    edtENDepartmentDepartmentName: TEdit;
    spbENDepartmentDepartment: TSpeedButton;
    lblContragentAddress: TLabel;
    edtContragentAddress: TEdit;
    Label7: TLabel;
    edtTKFINWorkType: TEdit;
    spbTKFINWorkType: TSpeedButton;
    lblContractType: TLabel;
    cbContractType: TComboBox;
    lblInfo: TLabel;    lblConnectionKind: TLabel;
    cbConnectionKind: TComboBox;
    chkShowCalcul: TCheckBox;
    spbTKClassificationType: TSpeedButton;
    edtTKClassificationTypeName: TEdit;
    lblKarta: TLabel;
    cbClassificationList: TComboBox;
    HTTPRIOTKClassificationType: THTTPRIO;
    chkShowClassificationList: TCheckBox;
    chbReplaceCounter: TCheckBox;
    edtNameCalculation: TEdit;
    rgPayable: TRadioGroup;
    cbCreatedFromSite: TCheckBox;
    lblContragentType: TLabel;
    cmbContragentType: TComboBox;
    HTTPRIOENServicesContragentType: THTTPRIO;
    gbPriconnections: TGroupBox;
    lblContragentPower: TLabel;
    edtContragentPower: TEdit;
    lblContragentAddressWork: TLabel;
    edtContragentAddressWork: TEdit;
    cbPresenceCommunicationsWithTreeCC: TComboBox;
    lblPresenceCommunicationsWithTreeCC: TLabel;
    edtNumberTU: TEdit;
    lblNumberTU: TLabel;
    lblNumberBundlesWithTreeCC: TLabel;
    edtNumberBundlesWithTreeCC1: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtNumberBundlesWithTreeCC2: TEdit;
    lblDateGen: TLabel;
    lblDateGenFrom: TLabel;
    edtDateGenFrom: TDateTimePicker;
    lblDateGenTo: TLabel;
    edtDateGenTo: TDateTimePicker;
    spbENSOValuesType: TSpeedButton;
    Label10: TLabel;
    spbSOValuesTypeClear: TSpeedButton;
    edtSOValuesTypeName: TEdit;
    edtENDepartmentDepartmentNameReliz: TEdit;
    lblENDepartmentDepartmentNameReliz: TLabel;
    spbENDepartmentDepartmentReliz: TSpeedButton;
    dtpEnActStart: TDateTimePicker;
    lbl1: TLabel;
    dtpEnActFinal: TDateTimePicker;
    lbl2: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
    procedure spbTKFINWorkTypeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure spbTKClassificationTypeClick(Sender: TObject);
    procedure cbClassificationListKeyPress(Sender: TObject; var Key: Char);
    procedure chkShowClassificationListClick(Sender: TObject);
    procedure spbENSOValuesTypeClick(Sender: TObject);
    procedure spbSOValuesTypeClearClick(Sender: TObject);
    procedure spbENDepartmentDepartmentRelizClick(Sender: TObject);

  private
    servicesContragentTypeNames2Codes : TDictionary<String, Integer>;
    soValuesTypeCode, departmentCode: Integer;
    { Private declarations }
  public
    { Public declarations }

    finWorkType : Integer;
    priconnections : Boolean;
    TKClassificationTypeCode : Integer;
    relaxation : Boolean;
    rent, guard : Boolean;
    project : Boolean;
  end;

var
  frmENServicesObjectFilterEdit: TfrmENServicesObjectFilterEdit;
  ENServicesObjectFilterObj: ENServicesObjectFilter;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
  ,ShowENElement
  ,ENElementController
  ,ENServicesContractStatusController, ENServicesObjectStatusController
  ,ENServicesContractTypeController
  ,ShowTKFINWorkType, ENConsts, ShowTKClassificationType,
  TKClassificationTypeController, ENTechConditionsObjectsController,
  ShowENSOValuesType;

{uses  
    EnergyproController, EnergyproController2, ENServicesObjectController  ;
}
{$R *.dfm}



procedure TfrmENServicesObjectFilterEdit.FormShow(Sender: TObject);
var
  i : Integer;
  TempClassificationType : TKClassificationTypeControllerSoapPort;
  calculationList : TKClassificationTypeShortList;
  servicesContragentTypeFilter : ENServicesContragentTypeFilter;
  servicesContragentTypeList : ENServicesContragentTypeShortList;
  servicesContragentTypeController : ENServicesContragentTypeControllerSoapPort;
  servicesContragentTypeShortObj : ENServicesContragentTypeShort;
begin

  // SUPP-75389
  servicesContragentTypeFilter := ENServicesContragentTypeFilter.Create;
  SetNullIntProps(servicesContragentTypeFilter);
  SetNullXSProps(servicesContragentTypeFilter);
  servicesContragentTypeNames2Codes := TDictionary<String, Integer>.Create;
  servicesContragentTypeController := HTTPRIOENServicesContragentType as ENServicesContragentTypeControllerSoapPort;
  servicesContragentTypeList := servicesContragentTypeController.getScrollableFilteredList(servicesContragentTypeFilter, 0, -1);
  cmbContragentType.Items.Add('');
  for servicesContragentTypeShortObj in servicesContragentTypeList.list do begin
    servicesContragentTypeNames2Codes.add(servicesContragentTypeShortObj.name, servicesContragentTypeShortObj.code);
	cmbContragentType.Items.Add(servicesContragentTypeShortObj.name);
  end;

  SetIntStyle([edtNumberBundlesWithTreeCC1,edtNumberBundlesWithTreeCC2]);

  if priconnections then
  begin
    chkShowClassificationList.Visible := False;
    lblKarta.Visible := False;
    edtTKClassificationTypeName.Visible := False;
    spbTKClassificationType.Visible := False;
    chbReplaceCounter.Visible := False;
    cbCreatedFromSite.Visible := False;
    edtNameCalculation.Visible := False;
    rgPayable.Visible := False;
    frmENServicesObjectFilterEdit.Width := 1000;
    gbPriconnections.Visible:= true;
  end;
  

  TempClassificationType := HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;

  if priconnections then
    HideControls([lblContractType, cbContractType])
  else
    HideControls([lblConnectionKind, cbConnectionKind]);

  TKClassificationTypeCode:= 0;
  //DisableControls([edtTKClassificationTypeName]);
  DisableControls([edtNameCalculation, edtSOValuesTypeName,edtENDepartmentDepartmentNameReliz]);

  // Заполнение списка
  if (chkShowClassificationList.Visible) then
  begin
    cbClassificationList.Items.Clear;
    calculationList := TempClassificationType.getClassificationListByCalculations;

    for i:=0 to High(calculationList.list) do
    begin
      cbClassificationList.Items.AddObject(calculationList.list[i].kod + ' :: ' + calculationList.list[i].name, calculationList.list[i]);
    end;  
  end;  
end;


procedure TfrmENServicesObjectFilterEdit.cbClassificationListKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (chkShowClassificationList.Visible) then
  begin
    if (Key=#13) and (TKClassificationTypeCode = 0) and (cbClassificationList.ItemIndex > -1) then
    begin
      Key:=#9;
      TKClassificationTypeCode :=
        TKClassificationTypeShort(cbClassificationList.Items.Objects[cbClassificationList.ItemIndex]).code;
      btnOk.SetFocus;
    end;
  end;
end;


procedure TfrmENServicesObjectFilterEdit.chkShowClassificationListClick(Sender: TObject);
begin
  inherited;
  if (chkShowClassificationList.Checked) then
  begin
    HideControls([lblKarta, edtTKClassificationTypeName, spbTKClassificationType]);
    cbClassificationList.Left := 57;
    TKClassificationTypeCode:= 0;
    edtTKClassificationTypeName.Text := '';
  end else
  begin
    HideControls([lblKarta, edtTKClassificationTypeName, spbTKClassificationType], False);
    cbClassificationList.Left := 957;
    TKClassificationTypeCode:= 0;
    cbClassificationList.ItemIndex := -1;
  end;

end;

procedure TfrmENServicesObjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  condition: String;
  isFilter_ : Boolean;
  connectionKind: Integer;
  contragentTypeCode : Integer;
begin

  isFilter_ := False;

  if (ModalResult = mrOk)  then
  begin
     condition := '';

     if (edtContractNumber.Text <> '') then
     begin
        ENServicesObjectFilterObj.contractNumber := edtContractNumber.Text;
        isFilter_ := True;
     end;
	 
	 if (Length(Trim(cmbContragentType.Text)) > 0) then
     begin
		if servicesContragentTypeNames2Codes.ContainsKey(cmbContragentType.Text) then begin
            ENServicesObjectFilterObj.contragentTypeRef := ENServicesContragentTypeRef.Create;
            ENServicesObjectFilterObj.contragentTypeRef.code := servicesContragentTypeNames2Codes[cmbContragentType.Text]; 			
            isFilter_ := True;
        end else begin
            raise Exception.Create(Format('Помилка: неможливо встановити ідентифікатор для запису ''%s''', [cmbContragentType.Text]));
		end;
     end;


     {
     if edtcontractDate.checked then
     begin
       if ENServicesObjectFilterObj.contractDate = nil then
          ENServicesObjectFilterObj.contractDate := TXSDate.Create;
       ENServicesObjectFilterObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end
     else
       ENServicesObjectFilterObj.contractDate := nil;
     }
     
     if edtContractDateFrom.Checked then
     begin
       AddCondition(condition, ' ENSERVICESOBJECT.CONTRACTDATE >= to_date(''' + DateToStr(edtContractDateFrom.Date) + ''', ''dd.MM.yyyy'')');
       isFilter_ := True;
     end;

     if edtContractDateTo.Checked then
     begin
       AddCondition(condition, ' ENSERVICESOBJECT.CONTRACTDATE <= to_date(''' + DateToStr(edtContractDateTo.Date) + ''', ''dd.MM.yyyy'')');
       isFilter_ := True;
     end;

     //ENServicesObjectFilterObj.name := edtName.Text;

     if (edtContragentName.Text <> '') then
     begin
       ENServicesObjectFilterObj.contragentName := edtContragentName.Text;
       isFilter_ := True;
     end;

     if (edtPartnerCode.Text <> '') then
     begin
       ENServicesObjectFilterObj.partnerCode := edtPartnerCode.Text;
       isFilter_ := True;
     end;

     if (edtFinDocCode.Text <> '') then
     begin
       ENServicesObjectFilterObj.finDocCode := edtFinDocCode.Text;
       isFilter_ := True;
     end;


     if (edtFinDocID.Text <> '') then
     begin
       ENServicesObjectFilterObj.finDocID := StrToInt(edtFinDocID.Text);
       isFilter_ := True;
     end
     else
       ENServicesObjectFilterObj.finDocID := Low(Integer);

     if (edtCommentGen.Text <> '') then
     begin
       ENServicesObjectFilterObj.commentGen := edtCommentGen.Text;
       isFilter_ := True;
     end;

     if (edtContractNumberServices.Text <> '') then
     begin
       // AddCondition(condition, ' enservicesobject.contractnumberservices in (' + edtContractNumberServices.Text + ')');
       ENServicesObjectFilterObj.contractNumberServices := edtContractNumberServices.Text;
       isFilter_ := True;
     end;

     //SUPP-83296
     if (edtContragentPower.Text <> '') then
     begin
        AddCondition(condition, ' enservicesobject.contractservicespower in (' + edtContragentPower.Text + ')');
       //ENServicesObjectFilterObj.contractServicesPower.DecimalString := edtContragentPower.Text;
       isFilter_ := True;
     end;

     //SUPP-83296
     if (edtContragentAddressWork.Text <> '') then
     begin
       ENServicesObjectFilterObj.contragentAddressWork := edtContragentAddressWork.Text;
       isFilter_ := True;
     end;

     if (chbReplaceCounter.Checked) then
     begin
       AddCondition(condition, ' enservicesobject.code in (select s.code ' +
           ' from enservicesobject s where s.elementcode in ( ' +
           ' select distinct pl.elementrefcode from enplanwork pl where pl.code in ( ' +
           ' select tcl.planrefcode ' +
           ' from enplanwork2classfctntp tcl, tkclassificationtype t ' +
           ' where tcl.classificationtyperfcd = t.code  and t.replacecounterkindcode = ' + IntToStr(TKREPLACECOUNTERKIND_REPLACE_COUNTER) + ') ))');
       isFilter_ := True;
     end;

     if (cbCreatedFromSite.Checked) then
     begin
       ENServicesObjectFilterObj.createdFromSite := YES;
       isFilter_ := True;
     end;


     if (edtContragentAddress.Text <> '') then
     begin
       ENServicesObjectFilterObj.contragentAddress := edtContragentAddress.Text;
       isFilter_ := True;
     end;


     {
     if edtContractDateServices.checked then
     begin
       if ENServicesObjectFilterObj.contractDateServices = nil then
          ENServicesObjectFilterObj.contractDateServices := TXSDate.Create;
       ENServicesObjectFilterObj.contractDateServices.XSToNative(GetXSDate(edtContractDateServices.DateTime));
     end
     else
       ENServicesObjectFilterObj.contractDateServices := nil;
     }
     if edtContractDateServicesFrom.Checked then
     begin
       AddCondition(condition, ' ENSERVICESOBJECT.CONTRACTDATESERVICES >= to_date(''' + DateToStr(edtContractDateServicesFrom.Date) + ''', ''dd.MM.yyyy'')');
       isFilter_ := True;
     end;

     if edtContractDateServicesTo.Checked then
     begin
       AddCondition(condition, ' ENSERVICESOBJECT.CONTRACTDATESERVICES <= to_date(''' + DateToStr(edtContractDateServicesTo.Date) + ''', ''dd.MM.yyyy'')');
       isFilter_ := True;
     end;

     if (edtContragentOkpo.Text <> '') then
     begin
       ENServicesObjectFilterObj.contragentOkpo := edtContragentOkpo.Text;
       isFilter_ := True;
     end;

     if cbContractType.ItemIndex > 0 then
     begin
       ENServicesObjectFilterObj.contractTypeRef := ENServicesContractTypeRef.Create;
       ENServicesObjectFilterObj.contractTypeRef.code := cbContractType.ItemIndex;
       isFilter_ := True;
     end
     else
       ENServicesObjectFilterObj.contractTypeRef := nil;

     if cbContractStatus.ItemIndex > 0 then
     begin
       ENServicesObjectFilterObj.contractStatusRef := ENServicesContractStatusRef.Create;
       ENServicesObjectFilterObj.contractStatusRef.code := cbContractStatus.ItemIndex;
       isFilter_ := True;
     end
     else
       ENServicesObjectFilterObj.contractStatusRef := nil;

     if cbStatus.ItemIndex > 0 then
     begin
       ENServicesObjectFilterObj.statusRef := ENServicesObjectStatusRef.Create;
       ENServicesObjectFilterObj.statusRef.code := cbStatus.ItemIndex;
       isFilter_ := True;
     end
     else
       ENServicesObjectFilterObj.statusRef := nil;

     if rgPayable.ItemIndex > -1 then
     begin
       ENServicesObjectFilterObj.isNoPay := rgPayable.ItemIndex;
       isFilter_ := True;
     end
     else
       ENServicesObjectFilterObj.isNoPay := LOW_INT;

     if (cbPresenceCommunicationsWithTreeCC.ItemIndex > -1) then
     begin
        AddCondition(condition, ' enservicesobject.code in (' +
        ' select q2.socode from ( select enso2.code as socode, '+
        ' (select case when count(enso2node.code) > 0 then ''0'' else ''1'' end from enso2node where enso2node.servicesobjectcode = enso2.code)as node_count from ENSERVICESOBJECT as enso2) q2 '+
        ' WHERE q2.node_count = ''' + IntToStr(cbPresenceCommunicationsWithTreeCC.ItemIndex) + ''')');

       isFilter_ := True;
     end;

     if (edtNumberTU.Text <> '') then
     begin
        AddCondition(condition, ' ENTECHCONDITIONSOBJCTS.NUMBERGEN like('''+
        '%'+ edtNumberTU.Text +'%'+ ''')');
       isFilter_ := True;
     end;

     if (edtNumberBundlesWithTreeCC1.Text <> '') and (edtNumberBundlesWithTreeCC2.Text = '') then
     begin
         AddCondition(condition, ' ENSERVICESOBJECT.code in ( '+
         'select q2.socode from ( select enso2.code as socode,'+
         '(select count(enso2node.code) from enso2node where enso2node.servicesobjectcode = enso2.code)as node_count from net.ENSERVICESOBJECT as enso2 ) q2 '+
         ' WHERE  q2.node_count >=  '+ edtNumberBundlesWithTreeCC1.Text + ')');
       isFilter_ := True;
     end;

     if (edtNumberBundlesWithTreeCC1.Text = '') and (edtNumberBundlesWithTreeCC2.Text <> '') then
     begin
         AddCondition(condition, ' ENSERVICESOBJECT.code in ( '+
         'select q2.socode from ( select enso2.code as socode,'+
         '(select count(enso2node.code) from enso2node where enso2node.servicesobjectcode = enso2.code)as node_count from net.ENSERVICESOBJECT as enso2 ) q2 '+
         ' WHERE  q2.node_count <= ' + edtNumberBundlesWithTreeCC2.Text + ')');
       isFilter_ := True;
     end;

     if (edtNumberBundlesWithTreeCC1.Text <> '') and (edtNumberBundlesWithTreeCC2.Text <> '') then
     begin
         AddCondition(condition, ' ENSERVICESOBJECT.code in ( '+
         'select q2.socode from ( select enso2.code as socode,'+
         '(select count(enso2node.code) from enso2node where enso2node.servicesobjectcode = enso2.code)as node_count from net.ENSERVICESOBJECT as enso2 ) q2 '+
         ' WHERE  q2.node_count BETWEEN ' + edtNumberBundlesWithTreeCC1.Text + ' and '+edtNumberBundlesWithTreeCC2.Text+ ')');
       isFilter_ := True;
     end;

     if (edtDateGenFrom.Checked) then
     begin
         AddCondition(condition, 'ENTECHCONDITIONSOBJCTS.DATEGEN >= to_date('''
         + DateToStr(edtDateGenFrom.Date) + ''', ''dd.MM.yyyy'')');
       isFilter_ := True;
     end;

     if (edtDateGenTo.Checked) then
     begin
         AddCondition(condition, 'ENTECHCONDITIONSOBJCTS.DATEGEN <= to_date('''
         + DateToStr(edtDateGenTo.Date) + ''', ''dd.MM.yyyy'')');
       isFilter_ := True;
     end;

     if (edtENDepartmentDepartmentName.Text <> '') then isFilter_ := True;

     if (edtTKClassificationTypeName.Text <> '') then isFilter_ := True;

     if priconnections then
     begin
       connectionKind := LOW_INT;
       case cbConnectionKind.ItemIndex 	of
         1: connectionKind := ENCONNECTIONKIND_UNDEFINED;
         2: connectionKind := ENCONNECTIONKIND_STANDART;
         3: connectionKind := ENCONNECTIONKIND_NO_STANDART;
         4: connectionKind := ENCONNECTIONKIND_NO_STANDART_READY_MADE;
         else connectionKind := LOW_INT;
       end;

       //AddCondition(condition, ' ENSERVICESOBJECT.CONTRACTDATESERVICES <= to_date(''' + DateToStr(edtContractDateServicesTo.Date) + ''', ''dd.MM.yyyy'')');
       if connectionKind <> LOW_INT then
         AddCondition(condition, ' ENSERVICESOBJECT.code in ' +
                                 '( ' +
                                 ' select so2tc.servicesobjectrefcode ' +
                                 '   from enservicesobject2techcondtnsservices so2tc, ' +
                                 '        entechconditionsservcs tc ' +
                                 '  where so2tc.techcondservrefcode = tc.code ' +
                                 '    and tc.connectionkindrefcode = ' + IntToStr(connectionKind) +
                                 ') ' );

       if soValuesTypeCode <> LOW_INT then
       begin
         AddCondition(condition, ' ENSERVICESOBJECT.code in ' +
                                 ' (select so.servicesobjectcode ' +
                                 '  from ensovalues so ' +
                                 '  where so.sovaluestypecode = ' + IntToStr(soValuesTypeCode) +
                                 '    and so.servicesobjectcode = ENSERVICESOBJECT.code)');
         isFilter_ := True;
       end;

       isFilter_ := True;
     end;

     //SUPP-94855
     if (edtENDepartmentDepartmentNameReliz.Text <> '') and (departmentCode <> LOW_INT) then
     begin
         AddCondition(condition, ' ENSERVICESOBJECT.techconobjectscode in ( '+
         'select entechconditionsobjcts.code from entechconditionsobjcts where entechconditionsobjcts.departmentcode = '+ IntToStr(departmentCode) + ')');
       isFilter_ := True;
     end;

     ENServicesObjectFilterObj.conditionSQL := condition;


     if (cbClassificationList.ItemIndex > 0) then
      TKClassificationTypeCode :=
        TKClassificationTypeShort(cbClassificationList.Items.Objects[cbClassificationList.ItemIndex]).code;


     if TKClassificationTypeCode > 0 then
        isFilter_ := True;

     if (dtpEnActStart.Checked or dtpEnActFinal.Checked) then
        isFilter_ := True;



     if not isFilter_ then
     begin
        Application.MessageBox(PChar('Виберіть хоча б один критерій пошуку ...'), PChar('Увага'), MB_ICONWARNING);
        Action := caNone;
        Exit;
     end;



  end;
end;

procedure TfrmENServicesObjectFilterEdit.spbENDepartmentDepartmentClick(Sender : TObject);
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


procedure TfrmENServicesObjectFilterEdit.spbENDepartmentDepartmentRelizClick(
  Sender: TObject);
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
               departmentCode := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentNameReliz.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENServicesObjectFilterEdit.spbENSOValuesTypeClick(
  Sender: TObject);
var
  frmENSOValuesTypeShow: TfrmENSOValuesTypeShow;
begin
  frmENSOValuesTypeShow := TfrmENSOValuesTypeShow.Create(Application, fmNormal);
  try
    with frmENSOValuesTypeShow do
    begin
      if ShowModal = mrOk then
      begin
        try
          soValuesTypeCode := StrToInt(GetReturnValue(sgENSOValuesType, 0));
          edtSOValuesTypeName.Text := GetReturnValue(sgENSOValuesType, 1);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENSOValuesTypeShow.Free;
  end;
end;

procedure TfrmENServicesObjectFilterEdit.spbSOValuesTypeClearClick(
  Sender: TObject);
begin
  soValuesTypeCode := LOW_INT;
  edtSOValuesTypeName.Text := '';
end;

procedure TfrmENServicesObjectFilterEdit.spbTKClassificationTypeClick(
  Sender: TObject);
  var
     frmTKClassificationTypeShow: TfrmTKClassificationTypeShow;
begin
   frmTKClassificationTypeShow := TfrmTKClassificationTypeShow.Create(Application, fmNormal);
   try
     DisableActions([frmTKClassificationTypeShow.actNoFilter,
           frmTKClassificationTypeShow.actInsert, frmTKClassificationTypeShow.actEdit,
           frmTKClassificationTypeShow.actDelete]);

     frmTKClassificationTypeShow.techCardSourceCondition := 'tktechcardsource.code = ' + IntToStr(TKTECHCARDSOURCE_CALCULATIONS);

     // SUPP-18899 отныне тестируем калькуляции на работем сервере
     // источник с тестовыми калькуляциями показываем только юзерам из списка
     if ((HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'energynet') or
         // SUPP-26858     KondratenkoOE
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'KondratenkoOE') or
         // SUPP-26856     asu_3 (Федорчак Наталя Юріївна), PalamarIN, TsaturovaLV
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'asu_3') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'PalamarIN') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'TsaturovaLV') or

         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'ZemlianskayaNF') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'GavrilenkoNV') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'ReznikMV') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'HomkoSO') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'NazarenkoOY') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'PerervaJG') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'MihnyukAA') )  then
     frmTKClassificationTypeShow.techCardSourceCondition := 'tktechcardsource.code in (' + IntToStr(TKTECHCARDSOURCE_CALCULATIONS) + ', ' + IntToStr(TKTECHCARDSOURCE_TEST_CALCULATIONS) + ', ' + IntToStr(TKTECHCARDSOURCE_CALCULATIONS_20141201) + ')';


      with frmTKClassificationTypeShow do
        if ShowModal = mrOk then
        begin
            try

               TKClassificationTypeCode := TKClassificationTypeShort(tvDep.Selected.Data).code;
               edtTKClassificationTypeName.Text := TKClassificationTypeShort(tvDep.Selected.Data).kod ;
               edtNameCalculation.Text := TKClassificationTypeShort(tvDep.Selected.Data).name;
            except
               on EConvertError do Exit;
            end;


        end;
   finally
      frmTKClassificationTypeShow.Free;
   end;

end;

procedure TfrmENServicesObjectFilterEdit.spbTKFINWorkTypeClick(
  Sender: TObject);
var 
   frmTKFINWorkTypeShow: TfrmTKFINWorkTypeShow;
begin
   frmTKFINWorkTypeShow:=TfrmTKFINWorkTypeShow.Create(Application,fmNormal);
   try
      frmTKFINWorkTypeShow.DisableActions([frmTKFINWorkTypeShow.actInsert,
                                           frmTKFINWorkTypeShow.actEdit,
                                           frmTKFINWorkTypeShow.actDelete]);   
      with frmTKFINWorkTypeShow do
        if ShowModal = mrOk then
        begin
            try
               finWorkType:= StrToInt(GetReturnValue(sgTKFINWorkType,0));
               edtTKFINWorkType.Text:= GetReturnValue(sgTKFINWorkType,2);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKFINWorkTypeShow.Free;
   end;
end;


procedure TfrmENServicesObjectFilterEdit.FormCreate(Sender: TObject);
begin
  inherited;
  priconnections := false;
  soValuesTypeCode := LOW_INT;
  departmentCode := LOW_INT;
end;


procedure TfrmENServicesObjectFilterEdit.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  cbClassificationListKeyPress(Sender, key);

  if (key=#13) then
    ModalResult := mrOk;
end;


end.

