
unit EditRQInvoice;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderController, RQInvoiceController,
  ExtCtrls , RQOrgRschetController, AdvObj

   ;

type
  TfrmRQInvoiceEdit = class(TDialogForm)
    pcRQInvoice: TPageControl;
    tsRQInvoice: TTabSheet;
    lblNumberDoc: TLabel;
    lblNumberProject: TLabel;
    lblDateGen: TLabel;
    lblCommentGen: TLabel;
    lblUserGen: TLabel;
    lblDateEdit: TLabel;
    edtNumberDoc: TEdit;
    edtNumberProject: TEdit;
    edtDateGen: TDateTimePicker;
    edtCommentGen: TMemo;
    edtUserGen: TEdit;
    edtDateEdit: TDateTimePicker;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIORQOrder: THTTPRIO;
    tsRQInvoiceItems: TTabSheet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    HTTPRIORQOrderItem: THTTPRIO;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sgRQInvoiceItem: TAdvStringGrid;
    lblCode: TLabel;
    edtCode: TEdit;
    HTTPRIORQMaterials: THTTPRIO;
    pnlTotal: TPanel;
    pnlTotalSum: TPanel;
    HTTPRIORQInvoice: THTTPRIO;
    HTTPRIORQInvoiceItem: THTTPRIO;
 	  HTTPRIORQBill: THTTPRIO;
    HTTPRIORQOrgRschet: THTTPRIO;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edtRschet: TEdit;
    edtBank: TEdit;
    edtMfo: TEdit;
    lblTKMaterialsMaterialName: TLabel;
    edtRQOrgOrgName: TEdit;
    spbRQOrgOrg: TSpeedButton;
    Label6: TLabel;
    edtVat: TEdit;
    pnlSum: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    pnlVatSum: TPanel;
    Label1: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
    procedure pcRQInvoiceChange(Sender: TObject);        
    procedure actUpdateExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbRQOrgOrgClick(Sender: TObject);
  
  private
    { Private declarations }
    selectedItemIndex: Integer;
  public
    { Public declarations }
    RQOrderObj: RQOrder;
    RQInvoiceObj: RQInvoice;
    RQOrgRschetObj: RQOrgRschet;
    procedure UpdateGrid(Sender: TObject);

end;

var
  frmRQInvoiceEdit: TfrmRQInvoiceEdit;
  //RQInvoiceObj: RQInvoice;


  RQInvoiceItemHeaders: array [1..9] of String =
        ( 'Код'
          , '№'
          , 'код РГК'
          , 'Матеріал'
          , 'Од. виміру'
          ,'Кількість'
          ,'Ціна (без ПДВ)'
          ,'Сума (без ПДВ)'
          ,'Примітка'
        );


// Если вдруг в гриде поменяются местами столбцы (RQOrderDepartmentHeaders),
// то достаточно изменить их индекс в этих константах
const
  DEPARTMENT_COL_NUMBER = 5; // № столбца 'Підрозділ'

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
  //,ShowENDepartment
  //,ENDepartmentController
  ,ShowRQOrderType
  ,RQOrderTypeController
  ,ShowRQOrderForm
  ,RQOrderFormController
  ,ShowRQOrderResource
  ,RQOrderResourceController
, ENDepartmentTypeController, ENConsts, RQOrderItemController,
  RQOrderStatusController, EditRQInvoiceItem, EditMaterialsIn,
  ShowRQOrder, RQOrderKindController, DMReportsUnit, Globals,
  RQDDSCodesController, StrUtils, RQMaterialsController, EditRQOrderItem,
  RQInvoiceStatusController
 ,RQInvoiceItemController
 ,ShowRQOrg
 ,RQOrgController
 ,RQBillController
 ,RQBillStatusController
 ,ShowRQOrgRschet
// ,RQOrgRschetController
 ,RQOrgBankController
 ;

{uses  
    EnergyproController, EnergyproController2, RQOrderController  ;
}
{$R *.dfm}



procedure TfrmRQInvoiceEdit.FormShow(Sender: TObject);
var
  TempRQInvoiceItem: RQInvoiceItemControllerSoapPort;
  itemList : RQInvoiceItemShortList;
  itemFilter : RQInvoiceItemFilter;
begin

  pcRQInvoice.ActivePage := tsRQInvoice;


{  DisableControls([edtENDepartmentDepartmentRefName, edtENDepartmentBudgetRefName
                   , edtRQOrderTypeRqOrderTypeName, edtRQOrderFormRqOrderFormName, edtRQOrderResourceRqOrderResourceName
                   , edtCode ]);

  HideControls([btnTDExcel, btnTDExport], (DialogState = dsInsert));
}


  if DialogState = dsEdit then
  begin
       TempRQInvoiceItem := HTTPRIORQInvoiceItem as RQInvoiceItemControllerSoapPort;
       itemFilter := RQInvoiceItemFilter.Create;
       SetNullIntProps(itemFilter);
       SetNullXSProps(itemFilter);
       itemFilter.invoiceRef := RQInvoiceRef.Create;
       itemFilter.invoiceRef.code := RQInvoiceObj.code;
       itemList := TempRQInvoiceItem.getScrollableFilteredList(itemFilter,0,1);

      { DisableControls([spbENDepartmentDepartmentRef, spbENDepartmentBudgetRef
                        , spbRQOrderFormRqOrderForm, spbRQOrderTypeRqOrderType, spbRQOrderResourceRqOrderResource
                        , edtOrderPeriod ]
                        , (itemList.totalCount > 0));
      }
  end;

{  if RQOrderObj.kindRef.code = RQORDER_KIND_DEPARTMENT then
    HideControls([btnTDExcel, btnTDExport, pnlTotal]);

  if RQOrderObj.kindRef.code = RQORDER_KIND_BUDGET then
  begin
      tsRQOrderDepartment.TabVisible := True;
      HideControls([lblENDepartmentDepartmentRefName, edtENDepartmentDepartmentRefName, spbENDepartmentDepartmentRef]);
  end;

  if RQOrderObj.kindRef.code = RQORDER_KIND_OE then
  begin
      tsRQOrderDepartment.TabVisible := True;
      tsRQOrderBudget.TabVisible := True;
      HideControls([lblENDepartmentDepartmentRefName, edtENDepartmentDepartmentRefName, spbENDepartmentDepartmentRef]);
      HideControls([lblENDepartmentBudgetRefName, edtENDepartmentBudgetRefName, spbENDepartmentBudgetRef]);
  end;
}
  if  (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if DialogState = dsView then
  begin
    DisableControls([
      edtRQOrgOrgName
      ,spbRQOrgOrg
       ]);
     DisableActions([actEdit, actInsert, actDelete]);
  end;
    
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([
      edtRschet
      ,edtMfo
      ,edtBank
      ,edtRQOrgOrgName
       ]);
    DenyBlankValues([
      edtNumberDoc
      ,edtDateGen
      ,edtDateEdit
      ,edtRQOrgOrgName
     ]);
   end;

{   if RQOrderObj.departmentRef <> nil then
   begin
       if RQOrderObj.departmentRef.code > LOW_INT then
           edtENDepartmentDepartmentRefName.Text := RQOrderObj.departmentRef.name;
   end;

   if RQOrderObj.budgetRef <> nil then
   begin
       if RQOrderObj.budgetRef.code > LOW_INT then
           edtENDepartmentBudgetRefName.Text := RQOrderObj.budgetRef.name;
   end;
}



  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQInvoiceObj.code);
    edtNumberDoc.Text := RQInvoiceObj.numberDoc;
    edtNumberProject.Text := RQInvoiceObj.numberProject;
      if RQInvoiceObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(RQInvoiceObj.dateGen.Year,RQInvoiceObj.dateGen.Month,RQInvoiceObj.dateGen.Day);

        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
    edtCommentGen.Text := RQInvoiceObj.commentGen; 
    //edtUserGen.Text := RQInvoiceObj.userGen;
      if RQInvoiceObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQInvoiceObj.dateEdit.Year,RQInvoiceObj.dateEdit.Month,RQInvoiceObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;

    edtRQOrgOrgName.Text := RQInvoiceObj.org.name;
    edtRschet.Text := RQInvoiceObj.orgRschet.rschet;
    edtBank.Text := RQInvoiceObj.orgRschet.bank.name;
    edtMfo.Text := RQInvoiceObj.orgRschet.mfo; 

    if (RQInvoiceObj.vat <> nil ) then
       edtVat.Text := RQInvoiceObj.vat.decimalString
    else
       edtVat.Text := '20';

  end;

  if  (DialogState = dsInsert) then
  begin
      RQInvoiceObj.statusRef := RQInvoiceStatusRef.Create;
      RQInvoiceObj.statusRef.code := 1;

      edtNumberProject.Text := 'Auto';
      edtNumberDoc.Text := 'Auto';

      edtDateEdit.DateTime:=SysUtils.Date;
      edtDateEdit.checked := true;

      edtDateGen.DateTime:=SysUtils.Date;
      edtDateGen.checked := true;
  end;

end;



procedure TfrmRQInvoiceEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQInvoice: RQInvoiceControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberDoc, edtRQOrgOrgName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQInvoice := HTTPRIORQInvoice as RQInvoiceControllerSoapPort;


     RQInvoiceObj.numberDoc := edtNumberDoc.Text; 
     RQInvoiceObj.numberProject := edtNumberProject.Text;

     if edtdateGen.checked then
     begin 
       if RQInvoiceObj.dateGen = nil then
       RQInvoiceObj.dateGen := TXSDate.Create;
       RQInvoiceObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       RQInvoiceObj.dateGen := nil;

     RQInvoiceObj.commentGen := edtCommentGen.Text;

     // RQInvoiceObj.userGen := edtUserGen.Text;

     if edtVat.Text <> '' then
       RQInvoiceObj.vat := TXSDecimal.Create;
     if edtVat.Text <> '' then
       RQInvoiceObj.vat.decimalString := edtVat.Text
     else
       RQInvoiceObj.vat := nil;


     if edtdateEdit.checked then
     begin
       if RQInvoiceObj.dateEdit = nil then
          RQInvoiceObj.dateEdit := TXSDate.Create;
       RQInvoiceObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQInvoiceObj.dateEdit := nil;

    if DialogState = dsInsert then
    begin
      RQInvoiceObj.code:=low(Integer);
      TempRQInvoice.add(RQInvoiceObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQInvoice.save(RQInvoiceObj);
    end;
  end;
end;




procedure TfrmRQInvoiceEdit.pcRQInvoiceChange(Sender: TObject);
Var i, j: Integer;
begin

 for i:=1 to sgRQInvoiceItem.RowCount-1 do
   for j:=0 to sgRQInvoiceItem.ColCount-1 do
     sgRQInvoiceItem.Cells[j,i]:='';

 UpdateGrid(Sender);
end;



procedure TfrmRQInvoiceEdit.UpdateGrid(Sender: TObject);
var
  i: Integer;

  TempRQInvoiceItem: RQInvoiceItemControllerSoapPort;
  RQInvoiceItemList: RQInvoiceItemShortList;
  RQInvoiceItemFilterObj : RQInvoiceItemFilter;

  TempRQOrder: RQOrderControllerSoapPort;
  RQOrderList: RQOrderShortList;
  RQOrderFilterObj : RQOrderFilter;

  vatSum, sum, totalSum, itemSum: Double;
begin
//
//----------------- tsRQInvoiceItems
  if pcRQInvoice.ActivePage = tsRQInvoiceItems then
  begin
      sum := 0;
      FormatSettings.DecimalSeparator := '.';

      SetGridHeaders(RQInvoiceItemHeaders, sgRQInvoiceItem.ColumnHeaders);

      sgRQInvoiceItem.SetFocus;

      TempRQInvoiceItem :=  HTTPRIORQInvoiceItem as RQInvoiceItemControllerSoapPort;

      RQInvoiceItemFilterObj := RQInvoiceItemFilter.Create;
      SetNullIntProps(RQInvoiceItemFilterObj);
      SetNullXSProps(RQInvoiceItemFilterObj);

      RQInvoiceItemFilterObj.invoiceRef := RQInvoiceRef.Create;
      RQInvoiceItemFilterObj.invoiceRef.code := RQInvoiceObj.code;

      RQInvoiceItemFilterObj.orderBySQL := 'TKMATERIALS.NAME';

      RQInvoiceItemList := TempRQInvoiceItem.getScrollableFilteredList(RQInvoiceItemFilterObj,0,-1);


      //LastCount:=High(RQInvoiceItemList.list);

      if High(RQInvoiceItemList.list) > -1 then
         sgRQInvoiceItem.RowCount:=High(RQInvoiceItemList.list)+2
      else
         sgRQInvoiceItem.RowCount:=2;

       with sgRQInvoiceItem do
        for i:=0 to High(RQInvoiceItemList.list) do
          begin
            Application.ProcessMessages;
            if RQInvoiceItemList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(RQInvoiceItemList.list[i].code)
            else
            Cells[0,i+1] := '';

            Cells[1,i+1] := IntToStr(i + 1);

            Cells[2,i+1] :=  RQInvoiceItemList.list[i].ddsCodesTxt;
            Cells[3,i+1] :=  RQInvoiceItemList.list[i].materialName;
            Cells[4,i+1] :=  RQInvoiceItemList.list[i].measurementName;

            if RQInvoiceItemList.list[i].countFact = nil then
              Cells[5,i+1] := ''
            else
              Cells[5,i+1] := SeparateThousands(RQInvoiceItemList.list[i].countFact.DecimalString);


            if RQInvoiceItemList.list[i].priceWithoutNds = nil then
              Cells[6,i+1] := ''
            else
              Cells[6,i+1] := SeparateThousands(RQInvoiceItemList.list[i].priceWithoutNds.DecimalString);

            Alignments[6, i + 1] := taRightJustify;
            Colors[6, i + 1] := $0080FF80;

            /////
            itemSum := 0;

            if RQInvoiceItemList.list[i].sumWithoutNds = nil then
              Cells[7,i+1] := ''
            else begin
              Cells[7,i+1] := SeparateThousands(RQInvoiceItemList.list[i].sumWithoutNds.DecimalString);
              try
                itemSum := StrToFloat(RQInvoiceItemList.list[i].sumWithoutNds.DecimalString);
              except
                itemSum := 0;
              end;
            end;

            Alignments[7, i + 1] := taRightJustify;

            sum := sum + itemSum;
            //totalSum := totalSum + itemSum;
            /////

            Cells[8,i+1] := RQInvoiceItemList.list[i].commentGen;

            sgRQInvoiceItem.RowCount:=High(RQInvoiceItemList.list)+2;
          end;
       //ColCount:=ColCount+1;
       sgRQInvoiceItem.Row:=1;

       totalSum := sum*1.2;
       vatSum := totalSum-sum;

    pnlSum.Caption := SeparateThousands(FloatToStr(Conv(sum, 2)));
    pnlVatSum.Caption := SeparateThousands(FloatToStr(Conv(vatSum, 2)));
    pnlTotalSum.Caption := SeparateThousands(FloatToStr(Conv(totalSum, 2)));
  end;
// END ---------------------- tsRQInvoiceItems


end;




procedure TfrmRQInvoiceEdit.actUpdateExecute(Sender: TObject);
begin
pcRQInvoiceChange(Sender);
end;



procedure TfrmRQInvoiceEdit.actInsertExecute(Sender: TObject);
var
 i,j: Integer;

 TempRQInvoiceItem: RQInvoiceItemControllerSoapPort;
 frmMaterialsInEdit: TfrmMaterialsInEdit;

 f : RQOrderFilter;
 TempRQOrder_: RQOrderControllerSoapPort;
 RQOrderList: RQOrderShortList;
 frmOrderShow : TfrmRQOrderShow;
begin

    if pcRQInvoice.ActivePage = tsRQInvoiceItems then
    begin
      try
        frmMaterialsInEdit := TfrmMaterialsInEdit.Create(Application, dsInsert);
        frmMaterialsInEdit.Caption := 'Редагування матеріалів у накладній';
        frmMaterialsInEdit.invoiceCode := RQInvoiceObj.code;
        frmMaterialsInEdit.isBill := false; 

        try
          if frmMaterialsInEdit.ShowModal = mrOk then
          begin
            if RQOrderItemObj<>nil then
                //TempRQOrderItem.add(RQOrderItemObj);
                //UpdateGrid(Sender);
          end;
        finally
          frmMaterialsInEdit.Free;
          frmMaterialsInEdit:=nil;
        end;
      finally
      end;
    end;
  UpdateGrid(Sender);
end;


procedure TfrmRQInvoiceEdit.actDeleteExecute(Sender: TObject);
Var
  TempRQInvoiceItem: RQInvoiceItemControllerSoapPort;
  TempRQInvoice: RQInvoiceControllerSoapPort;
  ObjCode: Integer;
begin
  inherited;
  // -------------- tsRQInvoiceItems

  if pcRQInvoice.ActivePage = tsRQInvoiceItems then
  begin
     TempRQInvoiceItem := HTTPRIORQInvoiceItem as RQInvoiceItemControllerSoapPort;
       try
         ObjCode := StrToInt(sgRQInvoiceItem.Cells[0,sgRQInvoiceItem.Row]);
       except
       on EConvertError do Exit;
      end;

      selectedItemIndex := sgRQInvoiceItem.Row;

      if Application.MessageBox(PChar('Ви дійсно бажаєте видалити пункт накладної ?'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
          TempRQInvoiceItem.remove(ObjCode);
          //UpdateGrid(Sender);
          //pcRQInvoiceChange(Sender);
      end;
  end;
  //-------------------   tsRQInvoiceItems



  pcRQInvoiceChange(Sender);

  if pcRQInvoice.ActivePage = tsRQInvoiceItems then
  begin
    if sgRQInvoiceItem.RowCount > selectedItemIndex then
      sgRQInvoiceItem.Row := selectedItemIndex
    else
      sgRQInvoiceItem.Row := sgRQInvoiceItem.RowCount - 1;
  end;
end;

procedure TfrmRQInvoiceEdit.actViewExecute(Sender: TObject);
Var
 TempRQInvoiceItem: RQInvoiceItemControllerSoapPort;
 TempRQInvoice: RQInvoiceControllerSoapPort;
 ObjCode: Integer;

begin
  inherited;
  // -------------- tsRQInvoiceItems
  if pcRQInvoice.ActivePage = tsRQInvoiceItems then
  begin
     TempRQInvoiceItem := HTTPRIORQInvoiceItem as RQInvoiceItemControllerSoapPort;
       try
         RQInvoiceItemObj := TempRQInvoiceItem.getObject(StrToInt(sgRQInvoiceItem.Cells[0,sgRQInvoiceItem.Row]));
       except
       on EConvertError do Exit;
      end;
      frmRQInvoiceItemEdit:=TfrmRQInvoiceItemEdit.Create(Application, dsView);
      try
        //frmRQInvoiceItemEdit.RQInvoiceItemObj := RQInvoiceItemObj;
        frmRQInvoiceItemEdit.ShowModal;
      finally
        frmRQInvoiceItemEdit.Free;
        frmRQInvoiceItemEdit:=nil;
      end;
  end;
  // --------  tsRQInvoiceItems
end;


procedure TfrmRQInvoiceEdit.actEditExecute(Sender: TObject);
Var
 TempRQInvoiceItem: RQInvoiceItemControllerSoapPort;
begin
  // -------------- tsRQInvoiceItems

  if pcRQInvoice.ActivePage = tsRQInvoiceItems then
  begin
     TempRQInvoiceItem := HTTPRIORQInvoiceItem as RQInvoiceItemControllerSoapPort;
       try
         RQInvoiceItemObj := TempRQInvoiceItem.getObject(StrToInt(sgRQInvoiceItem.Cells[0,sgRQInvoiceItem.Row]));
       except
       on EConvertError do Exit;
      end;

      selectedItemIndex := sgRQInvoiceItem.Row;

      frmRQInvoiceItemEdit:=TfrmRQInvoiceItemEdit.Create(Application, dsEdit);
      try
        //frmRQOrderItemEdit.orderKindCode := RQOrderObj.kindRef.code;
        //frmRQOrderItemEdit.ShowModal;
      finally
        frmRQInvoiceItemEdit.Free;
        frmRQInvoiceItemEdit:=nil;
      end;
  end;
  // --------  tsRQInvoiceItems


  pcRQInvoiceChange(Sender);

  if pcRQInvoice.ActivePage = tsRQInvoiceItems then
  begin
    if sgRQInvoiceItem.RowCount > selectedItemIndex then
      sgRQInvoiceItem.Row := selectedItemIndex
    else
      sgRQInvoiceItem.Row := sgRQInvoiceItem.RowCount - 1;
  end;
end;

procedure TfrmRQInvoiceEdit.FormDestroy(Sender: TObject);
begin
  inherited;
  if assigned(RQInvoiceObj) then RQInvoiceObj.Free;
end;



procedure TfrmRQInvoiceEdit.FormCreate(Sender: TObject);
begin
  selectedItemIndex := 1;
end;

procedure TfrmRQInvoiceEdit.spbRQOrgOrgClick(Sender: TObject);
var
   frmRQOrgShow: TfrmRQOrgShow;
   org : RQOrg;
   TempRQOrg : RQOrgControllerSoapPort;
   sDate, lDate, nDate: String;
   frmRQOrgRschetShow : TfrmRQOrgRschetShow;
   TempRQOrgRschet : RQOrgRschetControllerSoapPort;
begin
   frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try
               if RQInvoiceObj.org = nil then RQInvoiceObj.org := RQOrg.Create();
               SetNullIntProps(RQInvoiceObj.org);
               SetNullXSProps(RQInvoiceObj.org);
               edtRQOrgOrgName.Text := GetReturnValue(sgRQOrg,1);

               RQInvoiceObj.org.id := StrToInt(GetReturnValue(sgRQOrg,0)); // по ИД будем смотреть на серваке ...
               RQInvoiceObj.org.codeorg := GetReturnValue(sgRQOrg,8);
               RQInvoiceObj.org.name := GetReturnValue(sgRQOrg,1);
               RQInvoiceObj.org.ukr_name := GetReturnValue(sgRQOrg,9);
               RQInvoiceObj.org.okpo := GetReturnValue(sgRQOrg,2);
               RQInvoiceObj.org.nalog_num := GetReturnValue(sgRQOrg,3);
               RQInvoiceObj.org.svidet_num := GetReturnValue(sgRQOrg,4);
               RQInvoiceObj.org.adr := GetReturnValue(sgRQOrg,5);
               RQInvoiceObj.org.tel := GetReturnValue(sgRQOrg,6);
               RQInvoiceObj.org.country := GetReturnValue(sgRQOrg,10);
               RQInvoiceObj.org.region := GetReturnValue(sgRQOrg,11);
               RQInvoiceObj.org.ministry := GetReturnValue(sgRQOrg,12);
               RQInvoiceObj.org.ownership := StrToInt(GetReturnValue(sgRQOrg,13));
               RQInvoiceObj.org.type_ := GetReturnValue(sgRQOrg,14);
               RQInvoiceObj.org.master_code := GetReturnValue(sgRQOrg,15);

               sDate := GetReturnValue(sgRQOrg,16);
                 if sDate <> '' then
                   begin
                    RQInvoiceObj.org.date_svidet := TXSDate.Create;
                    RQInvoiceObj.org.date_svidet.XSToNative(GetXSDate(StrToDate(sDate)));
                   end;
               lDate := GetReturnValue(sgRQOrg,17);
                 if lDate <> '' then
                   begin
                    RQInvoiceObj.org.likv_date := TXSDate.Create;
                    RQInvoiceObj.org.likv_date.XSToNative(GetXSDate(StrToDate(lDate)));
                   end;

               RQInvoiceObj.org.except_flag := GetReturnValue(sgRQOrg,18);
               RQInvoiceObj.org.likv_flag := GetReturnValue(sgRQOrg,19);
               RQInvoiceObj.org.budget_flag := GetReturnValue(sgRQOrg,20);

               nDate := GetReturnValue(sgRQOrg,21);
                 if nDate <> '' then
                   begin
                    RQInvoiceObj.org.date_nalogform := TXSDate.Create;
                    RQInvoiceObj.org.date_nalogform.XSToNative(GetXSDate(StrToDate(nDate)));
                   end;

               RQInvoiceObj.org.id_nalogform := StrToInt(GetReturnValue(sgRQOrg,22));
               RQInvoiceObj.org.adr_legal := GetReturnValue(sgRQOrg,23);
               RQInvoiceObj.org.Primechan := GetReturnValue(sgRQOrg,7);



            except
               on EConvertError do Exit;
            end;
        end;

       frmRQOrgRschetShow := TfrmRQOrgRschetShow.Create(Application,fmNormal);

       frmRQOrgRschetShow.FilterObject := RQOrgRschetFilter.Create;
       SetNullIntProps(frmRQOrgRschetShow.FilterObject);
       SetNullXSProps(frmRQOrgRschetShow.FilterObject);
       RQOrgRschetFilter(frmRQOrgRschetShow.FilterObject).orgId := RQInvoiceObj.org.id;
       frmRQOrgRschetShow.Caption := 'Розрахункові рахунки';

     with frmRQOrgRschetShow do
        if ShowModal = mrOk then
        begin
            try
               if RQInvoiceObj.orgRschet = nil then RQInvoiceObj.orgRschet := RQOrgRschet.Create();
               RQInvoiceObj.orgRschet.bank := RQOrgBank.Create();

               RQInvoiceObj.orgRschet.id := StrToInt(GetReturnValue(sgRQOrgRschet,0));
               RQInvoiceObj.orgRschet.mfo := GetReturnValue(sgRQOrgRschet,3);
               RQInvoiceObj.orgRschet.rschet := GetReturnValue(sgRQOrgRschet,1);

               RQInvoiceObj.orgRschet.bank.id := StrToInt(GetReturnValue(sgRQOrgRschet,4));
               RQInvoiceObj.orgRschet.bank.mfo := GetReturnValue(sgRQOrgRschet,3);
               RQInvoiceObj.orgRschet.bank.name := GetReturnValue(sgRQOrgRschet,2);

               //////////////////
               edtRschet.Text := GetReturnValue(sgRQOrgRschet,1);
               edtMfo.Text := GetReturnValue(sgRQOrgRschet,3);
               edtBank.Text := GetReturnValue(sgRQOrgRschet,2);
               //////////////////


            except
               on EConvertError do Exit;
            end;
        end;


   finally
      frmRQOrgShow.Free;
   end;
end;



end.
