
unit EditENSizObject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENConsts,
    EnergyproController, EnergyproController2, ENSizObjectController, ExtCtrls, RQFKOrderController, EditRQFKOrder,
    AdvObj, ENPlanWorkTypeController, ENPlanWorkStateController,
    FINExecutorController, ENEstimateItemController, ShowFINMol,
    FINMolController;

type
    TfrmENSizObjectEdit = class(TDialogForm)
  
    lblCode : TLabel;
    edtCode : TEdit;
    HTTPRIOENSizObject: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    pcSizObject: TPageControl;
    tsMaterials: TTabSheet;
    spbKadry: TSpeedButton;
    lblTabNumber: TLabel;
    edtTabNumber: TEdit;
    lblSizCode: TLabel;
    edtSizCode: TEdit;
    lblProfesion: TLabel;
    edtProfesion: TMemo;
    lblFIO: TLabel;
    edtFio: TEdit;
    lblPodrId: TLabel;
    edtPodrId: TEdit;
    tsPlanWork: TTabSheet;
    lblSizNorm: TLabel;
    HTTPRIOTKMaterials: THTTPRIO;
    HTTPRIOTKTechCard: THTTPRIO;
    edtStatus: TComboBox;
    lblStatus: TLabel;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    sgENPlanWork: TAdvStringGrid;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    sgTKMaterials: TAdvStringGrid;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actReferenceMaterial: TAction;
    HTTPRIOENSizMaterials2TKMaterials: THTTPRIO;
    btnPrintOrder: TButton;
    GroupBox1: TGroupBox;
    lblGender: TLabel;
    cbbGender: TComboBox;
    lblGrowth: TLabel;
    edtGrowth: TEdit;
    lblSizeClothing: TLabel;
    edtSizeClothing: TEdit;
    lblSizeShoes: TLabel;
    edtSizeShoes: TEdit;
    lblSizeHead: TLabel;
    edtSizeHead: TEdit;
    tsIssue: TTabSheet;
    sgIssue: TAdvStringGrid;
    HTTPRIORQFKOrder: THTTPRIO;
    alPlans: TActionList;
    actViewPlan: TAction;
    actAddPlan: TAction;
    actEditPlan: TAction;
    actUpdate: TAction;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolButton16: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    spbDepartment: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;
    pnlLegend: TPanel;
    Shape1: TShape;
    Label2: TLabel;
    ppIssue: TPopupMenu;
    miWriteOffOnlyEnergyNET: TMenuItem;
    actIssue: TActionList;
    actWriteOffOnlyEnergyNET: TAction;
    HTTPRIOENEstimateItem: THTTPRIO;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    actView: TAction;
    N2: TMenuItem;
    btnUpdateStaffPosition: TButton;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbKadryClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure pcSizObjectChange(Sender: TObject);
    procedure sgENPlanWorkDblClick(Sender: TObject);
    function getRenCodeAX(podrId : String) : Integer;
    function getDepartmentCodeAX(podrId : String) : Integer;

    procedure actReferenceMaterialExecute(Sender: TObject);
    procedure WriteOffOnlyEnergyNET(Sender: TObject);
    procedure btnPrintOrderClick(Sender: TObject);
    procedure sgIssueDblClick(Sender: TObject);
    procedure actViewPlanExecute(Sender: TObject);
    procedure actEditPlanExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actAddPlanExecute(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure sgTKMaterialsDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure btnUpdateStaffPositionClick(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var frmENSizObjectEdit: TfrmENSizObjectEdit;
    ENSizObjectObj: ENSizObject;


implementation

uses
  ShowENElement
  ,ENElementController
  ,TKMaterialsController
  ,TKElement2TechCardController
  ,TKElementController
  ,TKTechCardController
  , FINWorkerController
  , ShowFINWorker
  , ShowENEPRen
  , ShowENDepartment, ENDepartmentController
  , ENPlanWorkController
  , DMReportsUnit, EditENPlanWork, ENDepartment2EPRenController,
  EditENSizMaterials2TKMaterials, ENSizMaterials2TKMaterialsController  ,
  ShowENGeographicDepartment, ENGeographicDepartmentController;



{$R *.dfm}


var
  materialsFilter : TKMaterialsFilter;
  element2TechCardFilter : TKElement2TechCardFilter;
  materialsLastRow : Integer = 1;
  operationLastRow : Integer = 1;
  materialsColCount, materialsLastCount, operationColCount, operationLastCount : Integer;

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanWorkHeaders: array [1..18] of String =
        ( 'Код'
          ,'Об''єкт планування'
          ,'Інв. №'
          ,'РЕЗ та ЕМ'
          ,'Рік плану'
          ,'Місяць плану'
          ,'Дата початку робіт'
          //,'Початк. місяць та рік плану (до перенесення)'
          //,'Початк. місяць плану'
          ,'ПідВид робіт'
          ,'Тип акту'
          ,'Вид плану'
          ,'Статус'
          ,'Підрозділ'
          ,'БюджетоТримач'
          ,'Центр відповідальності'
          ,'Початк. місяць та рік плану (до перенесення)'
          //,'Дата складання плану'
          ,'Номер наряда'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

  selectedRow : Integer;

  TKMaterialsHeaders : array [1..8] of String =
        ( 'Код'
          , 'назва'
          , 'кількість'
          , 'од.вим.'
          , 'терм. норм.'
          , 'матеріал для закупівлі'
          , 'поточний стан'
          , ''
        );

  SizMaterialsHeaders : array [1..6] of String =
        ( 'Код'
          , 'назва '
          , 'кількість'
          , 'од.вим.'
          , 'терм. норм.'
          , ''
        );

    SizIssueHeaders : array [1..8] of String =
        (  ' estimateitemcode'
          , 'Наименование'
          , 'Номенклатурный'
          , 'ед.изм.'
          , 'Номер документа'
          , 'Дата документа'
          ,' Кол-во'
          ,' Партия'


        );



procedure TfrmENSizObjectEdit.FormShow(Sender: TObject);
var
  techCardCode, i: Integer;
  TempTKMaterials: TKMaterialsControllerSoapPort;
  TempTKTechCard: TKTechCardControllerSoapPort;
  TKMaterialsList: TKMaterialsShortList;
  TKMaterials2List: TKMaterials2TechCardShortList;
  TKMaterialsFilterObj: TKMaterialsFilter;
  sizObjectShort: ENSizObjectShort;
  TempENSizObject: ENSizObjectControllerSoapPort;

  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
begin
  TempENSizObject := HTTPRIOENSizObject as ENSizObjectControllerSoapPort;
  pcSizObject.ActivePage := tsMaterials;
  spbDepartment.Visible := (DialogState = dsEdit);
  spbEPRen.Visible := (DialogState = dsEdit);
  btnUpdateStaffPosition.Visible := (DialogState = dsEdit) or (DialogState = dsView);

  DisableControls([edtGeograph]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtCode, edtTabNumber, edtProfesion, edtFio, edtPodrId, edtEPRenName  ]);
    DenyBlankValues([edtTabNumber, edtProfesion, edtFio, edtSizCode, edtStatus]);
  end;

  if DialogState = dsView then
  begin
    DisableControls([spbKadry, spbEPRen, edtStatus]);
  end;

  if (DialogState = dsInsert) then
   begin
     edtStatus.ItemIndex := 0;
     edtEPRenName.Visible := False;
     lblEPRenName.Visible := False;
     tsPlanWork.TabVisible := False;
     tsIssue.TabVisible := False;
     edtPodrId.Visible := False;
     lblPodrId.Visible := False;
     cbbGender.ItemIndex := 0;
     HideControls([btnPrintOrder]);
     DisableControls([btnGeograph  , btnGeographClear]);
   end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    sizObjectShort := TempENSizObject.getShortObject(ENSizObjectObj.code);

    if ENSizObjectObj.element.geoDepartmentRef <> nil then
      if ENSizObjectObj.element.geoDepartmentRef.code <> LOW_INT then
       begin
        // geodept
          TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
        try
          ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENSizObjectObj.element.geoDepartmentRef.code );
          edtGeograph.Text := ENGeographicDepartmentObj.name;
        except
          on EConvertError do Exit;
        end;
       end;

    if (DialogState = dsEdit) then DisableControls([spbKadry]);

    edtCode.Text := IntToStr(ENSizObjectObj.code);
    edtTabNumber.Text := ENSizObjectObj.tabNumber;
    MakeMultiline(edtProfesion.Lines, ENSizObjectObj.profesion);
    edtFio.Text := ENSizObjectObj.fio;

    if ( ENSizObjectObj.sizCode <> Low(Integer) ) then
       edtSizCode.Text := IntToStr(ENSizObjectObj.sizCode)
    else
       edtSizCode.Text := '';

    edtPodrId.Text := sizObjectShort.departmentRefShortName;
    edtStatus.ItemIndex := ENSizObjectObj.statusCode;

    edtEPRenName.Text := ENSizObjectObj.element.renRef.name;
    if (ENSizObjectObj.gender <> Low(Integer) ) then
       cbbGender.ItemIndex := ENSizObjectObj.gender
    else
       cbbGender.ItemIndex := 0;

    if ( ENSizObjectObj.growth <> nil ) then
       edtGrowth.Text := ENSizObjectObj.growth.DecimalString 
    else
       edtGrowth.Text := ''; 
    if ( ENSizObjectObj.sizeClothing <> nil ) then
       edtSizeClothing.Text := ENSizObjectObj.sizeClothing.decimalString
    else
       edtSizeClothing.Text := ''; 
    if ( ENSizObjectObj.sizeShoes <> nil ) then
       edtSizeShoes.Text := ENSizObjectObj.sizeShoes.decimalString
    else
       edtSizeShoes.Text := ''; 
    if ( ENSizObjectObj.sizeHead <> nil ) then
       edtSizeHead.Text := ENSizObjectObj.sizeHead.decimalString
    else
       edtSizeHead.Text := '';   

  end;

  if (ENSizObjectObj.sizCode <> Low(Integer)) and ((DialogState = dsEdit) or (DialogState = dsView)) then
    begin
      SetGridHeaders(TKMaterialsHeaders, sgTKMaterials.ColumnHeaders);
      TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
      TempTKTechCard := HTTPRIOTKTechCard as TKTechCardControllerSoapPort;

      techCardCode := TempTKTechCard.getKartaBySiz(ENSizObjectObj.sizCode);
      //TKMaterials2List := TempTKMaterials.getMaterialsListByTechCardCode(techCardCode);
      TKMaterials2List := TempTKMaterials.getMaterialsBySizObject(techCardCode, ENSizObjectObj.element.code);

      operationLastCount:=High(TKMaterials2List.list);
      if operationLastCount > -1 then
         sgTKMaterials.RowCount:=operationLastCount+2
      else
         sgTKMaterials.RowCount:=2;

       with sgTKMaterials do
        for i:=0 to operationLastCount do
        begin
            Application.ProcessMessages;
            if TKMaterials2List.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(TKMaterials2List.list[i].code)
            else
              Cells[0,i+1] := '';
            Cells[1,i+1] := TKMaterials2List.list[i].name;

            if TKMaterials2List.list[i].countGen = nil then
              Cells[2,i+1] := ''
            else
              Cells[2,i+1] := TKMaterials2List.list[i].countGen.DecimalString;

            Cells[3, i + 1] := TKMaterials2List.list[i].measurementName;
            Cells[4, i + 1] := TKMaterials2List.list[i].timeuseName;
            Cells[5, i + 1] := TKMaterials2List.list[i].numkatalog;

            if (TKMaterials2List.list[i].numkatalog <> '') and (TKMaterials2List.list[i].identid = '') then
              begin
                sgTKMaterials.RowColor[i + 1] := $008080FF; //clRed;
                Cells[6, i + 1] := 'не введено в експлуатацію';
              end
            else
              Cells[6, i + 1] := TKMaterials2List.list[i].identid;


            if TKMaterials2List.list[i].materialCode <> Low(Integer) then
              Cells[7,i+1] := IntToStr(TKMaterials2List.list[i].materialCode)
            else
              Cells[7,i+1] := '';


            operationLastRow :=i+1;
            sgTKMaterials.RowCount:= operationLastRow+1;
        end;

      operationColCount:=operationColCount+1;
      sgTKMaterials.Row:=1;
    end;

end;



procedure TfrmENSizObjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENSizObject: ENSizObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtTabNumber, edtProfesion, edtFio, edtSizCode]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempENSizObject := HTTPRIOENSizObject as ENSizObjectControllerSoapPort;

     ENSizObjectObj.tabNumber := edtTabNumber.Text;
     ENSizObjectObj.profesion := edtProfesion.Text;
     ENSizObjectObj.fio := edtFio.Text;

     if (edtSizCode.Text <> '' ) then
       ENSizObjectObj.sizCode := StrToInt(edtSizCode.Text)
     else
       ENSizObjectObj.sizCode := Low(Integer) ;

     ENSizObjectObj.statusCode := edtStatus.ItemIndex;
     ENSizObjectObj.gender := cbbGender.ItemIndex;

     if (ENSizObjectObj.growth = nil ) then
       ENSizObjectObj.growth := TXSDecimal.Create;
     if edtGrowth.Text <> '' then
       ENSizObjectObj.growth.decimalString := edtGrowth.Text
     else
       ENSizObjectObj.growth := nil;

     if (ENSizObjectObj.sizeClothing = nil ) then
       ENSizObjectObj.sizeClothing := TXSDecimal.Create;
     if edtSizeClothing.Text <> '' then
       ENSizObjectObj.sizeClothing.decimalString := edtSizeClothing.Text
     else
       ENSizObjectObj.sizeClothing := nil;

     if (ENSizObjectObj.sizeShoes = nil ) then
       ENSizObjectObj.sizeShoes := TXSDecimal.Create;
     if edtSizeShoes.Text <> '' then
       ENSizObjectObj.sizeShoes.decimalString := edtSizeShoes.Text
     else
       ENSizObjectObj.sizeShoes := nil;

     if (ENSizObjectObj.sizeHead = nil ) then
       ENSizObjectObj.sizeHead := TXSDecimal.Create;
     if edtSizeHead.Text <> '' then
       ENSizObjectObj.sizeHead.decimalString := edtSizeHead.Text
     else
       ENSizObjectObj.sizeHead := nil;

    if DialogState = dsInsert then
    begin
      ENSizObjectObj.code:=low(Integer);
      TempENSizObject.add(ENSizObjectObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSizObject.save(ENSizObjectObj);
    end;
  end;
end;


procedure TfrmENSizObjectEdit.spbKadryClick(Sender: TObject);
var
  frmFINWorkerShow: TfrmFINWorkerShow;
  f: FINWorkerFilter;
  w: FINWorker;
  TempFINWorker: FINWorkerControllerSoapPort;
  usesDAXData: Boolean;
begin
  f := FINWorkerFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  usesDAXData := DMReports.UsesMDAXData;

  frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal,f);
  try
    frmFINWorkerShow.dateGet := TXSDate.Create;

    //frmFINWorkerShow.humenKindCode := ENHUMENITEMKIND_ELTEH;
    DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
            try
              if ENSizObjectObj = nil then
              begin
                ENSizObjectObj := ENSizObjectObj.Create;
                ENSizObjectObj.code := low(Integer);
              end;

        {'Код'                     0
          ,'ФІО працівника'         1
          ,'табельний номер'         2
          ,'Посада'                   3
          ,'код посади із кадрів'      4
          ,'Підрозділ'                  5
          ,'код підрозділу'              6
          ,'оклад'                        7   !!!!!!!!!!!!!!!!
          ,'код категорії посади'          8
          ,'код із кадрів'                  9
          ,'код штатного'                    10
          ,' cehid'                           11}

              ENSizObjectObj.tabNumber := GetReturnValue(sgFINWorker,2);
              edtTabNumber.Text := GetReturnValue(sgFINWorker,2);

              ENSizObjectObj.fio := GetReturnValue(sgFINWorker,1);
              edtFio.Text := GetReturnValue(sgFINWorker,1);

              ENSizObjectObj.profesion := GetReturnValue(sgFINWorker,3);
              edtProfesion.Text := GetReturnValue(sgFINWorker,3);

              ENSizObjectObj.departmentRef := ENDepartmentRef.Create;
              ENSizObjectObj.departmentRef.code := getDepartmentCodeAX(GetReturnValue(sgFINWorker, 6));

              if ENSizObjectObj.element = nil then ENSizObjectObj.element := ENElement.Create();
              if ENSizObjectObj.element.renRef = nil then ENSizObjectObj.element.renRef := EPRenRef.Create();
              ENSizObjectObj.element.renRef.code := getRenCodeAX(GetReturnValue(sgFINWorker, 6));

            except
               on EConvertError do Exit;
            end;
        end;
  finally
    frmFINWorkerShow.Free;
  end;
end;


procedure TfrmENSizObjectEdit.spbDepartmentClick(Sender: TObject);
var
  frmENDepartmentShow : TfrmENDepartmentShow;
  f : ENDepartmentFilter;
begin
  inherited;

  f := ENDepartmentFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.code := 1;

  frmENDepartmentShow := TfrmENDepartmentShow.Create(Application, fmNormal, f);
  try
    frmENDepartmentShow.isShowAll := true;
    with frmENDepartmentShow do begin
      if ShowModal = mrOk then
      begin
        try
          ENSizObjectObj.departmentRef := ENDepartmentRef.Create;
          ENSizObjectObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
          edtPodrId.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENDepartmentShow.Free;
  end;
end;


procedure TfrmENSizObjectEdit.spbEPRenClick(Sender: TObject);
var
  frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow := TfrmENEPRenShow.Create(Application, fmNormal);
   try
      with frmEPRenShow do begin
        if ShowModal = mrOk then
        begin
          try
            if ENSizObjectObj.element = nil then ENSizObjectObj.element := ENElement.Create();
            if ENSizObjectObj.element.renRef = nil then ENSizObjectObj.element.renRef := EPRenRef.Create();

            edtEPRenName.Text := GetReturnValue(sgEPRen,1);
            ENSizObjectObj.element.renRef.code := StrToInt(GetReturnValue(sgEPRen,0));
          except
            on EConvertError do Exit;
          end;
        end;
      end;
   finally
      frmEPRenShow.Free;
   end;
end;


function TfrmENSizObjectEdit.getRenCodeAX(podrId : String) : Integer;
var
  TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  s : Integer;
begin
  // ХОЕ
  s := 0;

  TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
  renFilter := ENDepartment2EPRenFilter.Create;
  SetNullXSProps(renFilter);
  SetNullIntProps(renFilter);
  renFilter.conditionSQL := ' endepartment2epren.renrefcode in (select dp.renrefcode ' +
      ' from endepartment2epren dp, endepartment d ' +
      ' where dp.departmentrefcode = d.code ' +
      ' and d.datefinal is null and dp.renrefcode > 0 and dp.finrencode = ''' + Copy(podrId,0,3) + ''' )';

  renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter, 0, -1);
  if renList.totalCount > 0 then
     s := renList.list[0].renRefCode;
  result := s;
end;


procedure TfrmENSizObjectEdit.pcSizObjectChange(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  i, n, techCardCode : Integer;
  ENPlanWorkList: ENPlanWorkShortList;
  plFilter : ENPlanWorkFilter;
  TempTKMaterials : TKMaterialsControllerSoapPort;

  TempTKTechCard : TKTechCardControllerSoapPort;
  TKMaterials2List : TKMaterials2TechCardShortList;

  TKIssue2List : TKMaterials2TechCardShortList;
  
begin
   //-----------------------------------------
   if pcSizObject.ActivePage = tsPlanWork then
   begin
      SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
      ColCount:=100;
      TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

      plFilter := ENPlanWorkFilter.Create;
      SetNullIntProps(plFilter);
      SetNullXSProps(plFilter);
      plFilter.elementRef := ENElementRef.Create;
      plFilter.elementRef.code := ENSizObjectObj.element.code;
      plFilter.orderBySQL := 'enplanwork.code desc';

      ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(ENPlanWorkFilter(plFilter),0,ColCount);

     try

      LastCount := High(ENPlanWorkList.list);

      if LastCount > -1 then
         sgENPlanWork.RowCount:=LastCount+2
      else
         sgENPlanWork.RowCount:=2;

       with sgENPlanWork do
        for i:=0 to LastCount do
          begin
            Application.ProcessMessages;

            n := 0;

            if ENPlanWorkList.list[i].code <> Low(Integer) then
            Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].code)
            else
            Cells[n,i+1] := '';
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].objectName;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].invNumber;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].renRefName;
            inc(n);

            if ENPlanWorkList.list[i].yearGen <> Low(Integer) then
              Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].yearGen)
            else
              Cells[n,i+1] := '';
            inc(n);

            if ENPlanWorkList.list[i].monthGen <> Low(Integer) then
              //Cells[4,i+1] := IntToStr(ENPlanWorkList.list[i].monthGen)
              Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthGen]
            else
              Cells[n,i+1] := '';
            inc(n);

            if ENPlanWorkList.list[i].dateStart = nil then
              Cells[n,i+1] := ''
            else
              Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateStart);
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].typeRefName;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].stateRefShortName;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].kindName ;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].statusName;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].departmentRefShortName;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].budgetRefShortName;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].responsibilityRefShortName;
            inc(n);

            Cells[n,i+1] := '';

            //if ENPlanWorkList.list[i].yearOriginal <> Low(Integer) then
            if ENPlanWorkList.list[i].yearOriginal > 0 then
            begin
              //if ENPlanWorkList.list[i].monthOriginal <> Low(Integer) then
              if ENPlanWorkList.list[i].monthOriginal > 0 then
                Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthOriginal] + ' ' +
                                IntToStr(ENPlanWorkList.list[i].yearOriginal);
            end
            else
              Cells[n,i+1] := '';
            inc(n);
            /////

            Cells[n,i+1] := ENPlanWorkList.list[i].workOrderNumber;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].userGen;
            inc(n);

            if ENPlanWorkList.list[i].dateEdit = nil then
              Cells[n,i+1] := ''
            else
              Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateEdit);
            inc(n);

            LastRow:=i+1;
            sgENPlanWork.RowCount:=LastRow+1;
          end;

       ColCount:=ColCount+1;
       sgENPlanWork.Row:=1;
     finally
      ENPlanWorkList.Free;
     end;
   end;
   // pcSizObject.ActivePage = tsPlanWork

   if pcSizObject.ActivePage = tsIssue then
    begin
      SetGridHeaders(SizIssueHeaders, sgIssue.ColumnHeaders);
      TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;

      TKIssue2List := TempTKMaterials.getIssueBySizObject(techCardCode, ENSizObjectObj.element.code);


      operationLastCount:=High(TKIssue2List.list);
      if operationLastCount > -1 then
         sgIssue.RowCount:=operationLastCount+2
      else
         sgIssue.RowCount:=2;

       with sgIssue do
        for i:=0 to operationLastCount do
          begin
            Application.ProcessMessages;

            if TKIssue2List.list[i].estimateItemCode <> Low(Integer) then
            Cells[0,i+1] := IntToStr(TKIssue2List.list[i].estimateItemCode )  // kod estimate
            else
            Cells[0,i+1] := '';

            Cells[1,i+1] := TKIssue2List.list[i].identid;
            Cells[2,i+1] := TKIssue2List.list[i].accountingTypeRefName;
            Cells[3,i+1] := TKIssue2List.list[i].axMaterialsRefName;
            Cells[4,i+1] := TKIssue2List.list[i].axMaterialsRefStatus;
            Cells[5,i+1] := TKIssue2List.list[i].elementName;

            if TKIssue2List.list[i].countGen = nil then
              Cells[6,i+1] := ''
            else
            Cells[6,i+1] := TKIssue2List.list[i].countGen.DecimalString;

            Cells[7,i+1] := TKIssue2List.list[i].party_id;

            if TKIssue2List.list[i].isWrittenOff > 0 then
               sgIssue.RowColor[i + 1] := clRed
            else
               sgIssue.RowColor[i + 1] := clNone;

            operationLastRow :=i+1;
            sgIssue.RowCount:= operationLastRow+1;
          end;
         operationColCount:=operationColCount+1;
         sgIssue.Row:=1;

    end;

end;


procedure TfrmENSizObjectEdit.sgENPlanWorkDblClick(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  tPlan : ENPlanWork;
  objCode : Integer;
begin
   try
    objCode:=StrToInt( sgENPlanWork.Cells[0, sgENPlanWork.row] );
   except
    on EConvertError do Exit;
   end;

   tPlan := DMReports.getPlanByCode( objCode );

   if tPlan = nil then
   begin
       exit;
   end;

   TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

   selectedRow := sgENPlanWork.Row;

   frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);

   if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT) and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
    frmENPlanWorkEdit.isTransport := true;

   if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
    frmENPlanWorkEdit.isSiz := true;

   try

     try
       frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject( objCode );
     except
       on EConvertError do Exit;
     end;

     frmENPlanWorkEdit.ShowModal;

   finally
     frmENPlanWorkEdit.Free;
     frmENPlanWorkEdit:=nil;
   end;
end;


procedure TfrmENSizObjectEdit.actAddPlanExecute(Sender: TObject);
var
  department: ENDepartment;
  TempENDepartment: ENDepartmentControllerSoapPort;
begin
  inherited;
  TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsInsert);
  try
    frmENPlanWorkEdit.ENPlanWorkObj := ENPlanWork.Create;

    frmENPlanWorkEdit.ENPlanWorkObj.renRef := EPRenRef.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.renRef.code := ENSizObjectObj.element.renRef.code;
    frmENPlanWorkEdit.edtEPRenName.Text := ENSizObjectObj.element.renRef.name;

    department := TempENDepartment.getObject(ENSizObjectObj.departmentRef.code);

    frmENPlanWorkEdit.ENPlanWorkObj.departmentRef := ENDepartmentRef.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.departmentRef.code := department.code;
    frmENPlanWorkEdit.edtDepartment.Text:= department.shortName;

    frmENPlanWorkEdit.isSiz := True;
    frmENPlanWorkEdit.ENPlanWorkObj.elementRef := ENElementRef.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.elementRef.code := ENSizObjectObj.element.code;

    frmENPlanWorkEdit.edtENElementName.Text := ENSizObjectObj.fio;
    frmENPlanWorkEdit.edtInvNumber.Text := ENSizObjectObj.tabNumber;

    frmENPlanWorkEdit.ENPlanWorkObj.typeRef := ENPlanWorkTypeRef.Create();
    frmENPlanWorkEdit.ENPlanWorkObj.typeRef.code := ENPLANWORKTYPE_SIZ;
    frmENPlanWorkEdit.edtTypeName.Text:= 'Засоби захисту';
    frmENPlanWorkEdit.ENPlanWorkObj.stateRef := ENPlanWorkStateRef.Create();
    frmENPlanWorkEdit.ENPlanWorkObj.stateRef.code := ENPLANWORKSTATE_SIZ;
    frmENPlanWorkEdit.edtWorkState.Text:= 'Спецодяг';
    frmENPlanWorkEdit.cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_CURRENT-1;

    frmENPlanWorkEdit.ENPlanWorkObj.budgetRef := ENDepartmentRef.Create();
    frmENPlanWorkEdit.ENPlanWorkObj.budgetRef.code := ENBUDGET_SOT;
    frmENPlanWorkEdit.edtENBudgetName.Text := 'СОТ';

    frmENPlanWorkEdit.ENPlanWorkObj.responsibilityRef := ENDepartmentRef.Create();
    frmENPlanWorkEdit.ENPlanWorkObj.responsibilityRef.code := ENRESPONSIBILITY_SOT;
    frmENPlanWorkEdit.edtResponsibility.Text := 'СОТ';

    frmENPlanWorkEdit.ENPlanWorkObj.finExecutor := FINExecutor.Create();
    frmENPlanWorkEdit.ENPlanWorkObj.finExecutor.name := 'Відділ матеріально-технічного постачання';
    frmENPlanWorkEdit.ENPlanWorkObj.finExecutor.finCode := 45;
    frmENPlanWorkEdit.ENPlanWorkObj.finExecutor.finTypeName := 'Промышленный персонал';
    frmENPlanWorkEdit.ENPlanWorkObj.finExecutor.finTypeCode := 1;
    frmENPlanWorkEdit.ENPlanWorkObj.finExecutor.finKindName := 'Відділ';
    frmENPlanWorkEdit.ENPlanWorkObj.finExecutor.finKindCode := 3;
    frmENPlanWorkEdit.ENPlanWorkObj.finExecutor.finCehName := 'Апарат управління';
    frmENPlanWorkEdit.ENPlanWorkObj.finExecutor.finCehCode := 3;
    frmENPlanWorkEdit.edtFINExecutorName.Text := 'Відділ матеріально-технічного постачання';

    ///// MDAX-441
    frmENPlanWorkEdit.ENPlanWorkObj.finExecutor.axOrgId := '018';
    frmENPlanWorkEdit.ENPlanWorkObj.finExecutor.axParentOrgId := '0001';
    frmENPlanWorkEdit.ENPlanWorkObj.finExecutor.axParentOrgName := 'АДМІНІСТРАТИВНО-УПРАВЛІНСЬКА ЧАСТИНА';
    frmENPlanWorkEdit.ENPlanWorkObj.finExecutor.axOrgTypeId := 3;
    frmENPlanWorkEdit.ENPlanWorkObj.finExecutor.axOrgTypeName := 'Отдел';
    /////

    DisableControls([frmENPlanWorkEdit.spbENElement, frmENPlanWorkEdit.edtTypeName, frmENPlanWorkEdit.spbType,
        frmENPlanWorkEdit.edtWorkState, frmENPlanWorkEdit.spbENPlanWorkState,
        frmENPlanWorkEdit.edtENBudgetName, frmENPlanWorkEdit.edtResponsibility,
        frmENPlanWorkEdit.spbENBudget, frmENPlanWorkEdit.spbResponsibility]);

    if frmENPlanWorkEdit.ShowModal = mrOk then
    begin
      actUpdateExecute(Sender);
    end;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;
end;


procedure TfrmENSizObjectEdit.actEditPlanExecute(Sender: TObject);
var
  ObjCode : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  tPlan : ENPlanWork;
begin
  inherited;
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode(ObjCode);
  if tPlan = nil then Exit;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if (tPlan.status.code = ENPLANWORKSTATUS_PRECONFIRMED) then
  begin
    try
      TempENPlanWork.editPreConfirm(tPlan.code);
    except
      Application.MessageBox(PChar('Цей план можуть коригувати тільки у ХОЕ!'), PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;
  end;

  if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])
  then
  begin
    Application.MessageBox(PChar('План затверджений!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (tPlan.kind.code = ENPLANWORKKIND_CALCULATION) then
  begin
    Application.MessageBox(PChar('Кошторис не редагується!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsEdit);
  try
    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(ObjCode);
    frmENPlanWorkEdit.isSiz := true;

    if frmENPlanWorkEdit.ShowModal = mrOk then
    begin
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;
end;


procedure TfrmENSizObjectEdit.actReferenceMaterialExecute(Sender: TObject);
var
  TempENSizMaterials2TKMaterials: ENSizMaterials2TKMaterialsControllerSoapPort;
begin
  TempENSizMaterials2TKMaterials := HTTPRIOENSizMaterials2TKMaterials as ENSizMaterials2TKMaterialsControllerSoapPort;

  if sgTKMaterials.Cells[0,sgTKMaterials.Row] <> '' then
  begin
    try
      ENSizMaterials2TKMaterialsObj := TempENSizMaterials2TKMaterials.getObject(StrToInt(sgTKMaterials.Cells[0,sgTKMaterials.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSizMaterials2TKMaterialsEdit := TfrmENSizMaterials2TKMaterialsEdit.Create(Application, dsInsert);

    ENSizMaterials2TKMaterialsObj.parentRef := ENSizMaterials2TKMaterialsRef.Create;
    ENSizMaterials2TKMaterialsObj.parentRef.code := ENSizMaterials2TKMaterialsObj.code;

    frmENSizMaterials2TKMaterialsEdit.edtSizMaterial.Text := sgTKMaterials.Cells[1,sgTKMaterials.Row];
    frmENSizMaterials2TKMaterialsEdit.edtRealMaterial.Text := sgTKMaterials.Cells[5,sgTKMaterials.Row];
  end else
  begin
    ENSizMaterials2TKMaterialsObj := ENSizMaterials2TKMaterials.Create();
    ENSizMaterials2TKMaterialsObj.elementRef := ENElementRef.Create();
    ENSizMaterials2TKMaterialsObj.elementRef.code := ENSizObjectObj.element.code;
    ENSizMaterials2TKMaterialsObj.sizMaterialsRef := TKMaterialsRef.Create();
    ENSizMaterials2TKMaterialsObj.sizMaterialsRef.code := StrToInt(sgTKMaterials.Cells[7,sgTKMaterials.Row]);

    frmENSizMaterials2TKMaterialsEdit := TfrmENSizMaterials2TKMaterialsEdit.Create(Application, dsInsert);
    frmENSizMaterials2TKMaterialsEdit.edtSizMaterial.Text := sgTKMaterials.Cells[1,sgTKMaterials.Row];
  end;

  try
    if frmENSizMaterials2TKMaterialsEdit.ShowModal = mrOk then
    begin
      FormShow(Sender);
    end;
  finally
    frmENSizMaterials2TKMaterialsEdit.Free;
    frmENSizMaterials2TKMaterialsEdit := nil;
  end;
end;


procedure TfrmENSizObjectEdit.WriteOffOnlyEnergyNET(Sender: TObject);
var
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  eiCode : Integer;
  masterMOLCode:String;
  ENEstimateItemObj: ENEstimateItem;
  selectedFinMol : FINMolShort;
begin
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

  if sgIssue.Cells[0,sgIssue.Row] <> '' then
  begin
    try
      eiCode := StrToInt(sgIssue.Cells[0,sgIssue.Row]);
    except
      on EConvertError do Exit;
    end;
  end;

  selectedFinMol := TfrmFINMolShow.chooseFromList();
  if Assigned(selectedFinMol) then begin
      masterMOLCode := selectedFinMol.id;
      //edtMol.Text := masterMOLCode + ' ' + selectedObj.text;
      ENEstimateItemObj := ENEstimateItem.Create;
      ENEstimateItemObj.code := eiCode;
      ENEstimateItemObj.countFact := TXSDecimal.Create;
      ENEstimateItemObj.countFact.DecimalString := sgIssue.Cells[6,sgIssue.Row];

      TempENEstimateItem.writeOffZZOnlyEnergyNETBySizObject(ENEstimateItemObj ,  masterMOLCode   );
      Self.pcSizObjectChange(Sender);
  end;
end;


procedure TfrmENSizObjectEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  pcSizObjectChange(Sender);
end;


procedure TfrmENSizObjectEdit.actViewExecute(Sender: TObject);
var
  TempENSizMaterials2TKMaterials: ENSizMaterials2TKMaterialsControllerSoapPort;
begin
  inherited;
  TempENSizMaterials2TKMaterials := HTTPRIOENSizMaterials2TKMaterials as ENSizMaterials2TKMaterialsControllerSoapPort;
  try
    ENSizMaterials2TKMaterialsObj := TempENSizMaterials2TKMaterials.getObject(StrToInt(sgTKMaterials.Cells[0, sgTKMaterials.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENSizMaterials2TKMaterialsEdit := TfrmENSizMaterials2TKMaterialsEdit.Create(Application, dsView);
  try
    frmENSizMaterials2TKMaterialsEdit.ShowModal;
  finally
    frmENSizMaterials2TKMaterialsEdit.Free;
    frmENSizMaterials2TKMaterialsEdit := nil;
  end;

end;


procedure TfrmENSizObjectEdit.actViewPlanExecute(Sender: TObject);
var
  objCode : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  tPlan : ENPlanWork;
begin
  inherited;
  try
    objCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode( objCode );
  if tPlan = nil then Exit;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);

  try
    try
      frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject( objCode );
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkEdit.ShowModal;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;
end;


procedure TfrmENSizObjectEdit.btnGeographClearClick(Sender: TObject);
begin
  ENSizObjectObj.element.geoDepartmentRef.code := LOW_INT;
  edtGeograph.Text := '';

end;

procedure TfrmENSizObjectEdit.btnGeographClick(Sender: TObject);
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
                 ENSizObjectObj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENSizObjectEdit.btnPrintOrderClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  TempTKTechCard : TKTechCardControllerSoapPort;
  depShort : ENDepartmentShort;
  techCardCode : Integer;
  podrshort : string;
begin
  SetLength(argNames, 3);
  SetLength(args, 3);

  TempTKTechCard := HTTPRIOTKTechCard as TKTechCardControllerSoapPort;
  techCardCode := TempTKTechCard.getKartaBySiz(ENSizObjectObj.sizCode);


  argnames[0] := 'sizElementCode';
  args[0] := IntToStr( ENSizObjectObj.element.code );

  argnames[1] := 'techCardCode';
  args[1] := IntToStr( techCardCode );

  argnames[2] := 'podrshort';
  args[2] := podrshort;

  reportName := 'SZ/sz_card';
  makeReport(reportName, argNames, args, 'xls');


  reportName := 'SZ/sz_card_issue_return';
  makeReport(reportName, argNames, args, 'xls');
end;


procedure TfrmENSizObjectEdit.btnUpdateStaffPositionClick(Sender: TObject);
var
  objCode: Integer;
  TempENSizObject: ENSizObjectControllerSoapPort;
begin
  inherited;
  if ENSizObjectObj = nil then Exit;
  if ENSizObjectObj.code = Low(Integer) then Exit;
  objCode := ENSizObjectObj.code;

  if Application.MessageBox(PChar('Буде буде оновлено посаду та підрозділ співробітника зі штатним розкладом.' + #13#10 +
          'Продовжити?'), PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then Exit;

  TempENSizObject := HTTPRIOENSizObject as ENSizObjectControllerSoapPort;
  TempENSizObject.updateStaffPosition(ENSizObjectObj.code, ENSizObjectObj.tabNumber);

  ENSizObjectObj := nil;
  ENSizObjectObj := TempENSizObject.getObject(objCode);
  FormShow(Sender);
end;


procedure TfrmENSizObjectEdit.sgIssueDblClick(Sender: TObject);
var
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  fFilter : RQFKOrderFilter;
  fList : RQFKOrderShortList;
  eiCode : Integer;
begin
    try
     eiCode:=StrToInt( sgIssue.Cells[0, sgIssue.row] );
    except
    on EConvertError do Exit;
    end;

	TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  fFilter := RQFKOrderFilter.Create;
  SetNullXSProps(fFilter);
  SetNullIntProps(fFilter);
  fFilter.conditionSQL := ' RQFKORDER.CODE in (  select ff.code from rqfkorder ff , rqfkorderitem ffi , rqfkorderitem2enstmttm ffi2ei ' +
                          ' where ff.code = ffi.fkorderrefcode ' +
                          ' and ffi.code = ffi2ei.fkorderitemrefcode ' +
                          ' and ffi2ei.estimateitemcode= ' + IntToStr(eiCode)   +
                          ' and ff.kindcode in (11,12,8,9)  )';
  fList := TempRQFKOrder.getScrollableFilteredList(fFilter, 0, -1);
  if fList.totalCount > 0 then begin
    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  frmRQFKOrderEdit:=TfrmRQFKOrderEdit.Create(Application, dsView);
  try
    try
      frmRQFKOrderEdit.RQFKOrderObj := TempRQFKOrder.getObject(fList.List[0].code);
    except
      on EConvertError do Exit;
    end;

    frmRQFKOrderEdit.ShowModal;
  finally
    frmRQFKOrderEdit.Free;
    frmRQFKOrderEdit:=nil;
  end;
  end;
end;


procedure TfrmENSizObjectEdit.sgTKMaterialsDblClick(Sender: TObject);
begin
  inherited;
  actViewExecute(Sender);
end;


function TfrmENSizObjectEdit.getDepartmentCodeAX(podrId: String): Integer;
var
  TempENDepartment: ENDepartmentControllerSoapPort;
  departmentFilter: ENDepartmentFilter;
  departmentShortList: ENDepartmentShortList;
  s: Integer;
begin
  // АТ "Херсонобленерго"
  s := ENDEPARTMENT_KSOE;

  TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
  departmentFilter := ENDepartmentFilter.Create;
  SetNullXSProps(departmentFilter);
  SetNullIntProps(departmentFilter);
  departmentFilter.conditionSQL := ' hrmorganizationid = ''' + podrId + '''';

  departmentShortList := TempENDepartment.getScrollableFilteredList(departmentFilter, 0, -1);

  if departmentShortList.totalCount > 0 then
    s := departmentShortList.list[0].code
  else
  begin
    departmentFilter.conditionSQL := ' hrmorganizationid = ''' + Copy(podrId,0,3) + '''';
    departmentShortList := TempENDepartment.getScrollableFilteredList(departmentFilter, 0, -1);
    if departmentShortList.totalCount > 0 then
      s := departmentShortList.list[0].code;
  end;

  result := s;
end;


end.
