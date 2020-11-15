% x patterns
% c cluster centers
% u participation
function result = evaluate_fuzzy_clusters(x, c, u)
  fuzzy_hyper_volume = [];
  average_partition_density = [];
  average_within_cluster_distance = [];
  average_cluster_flatness = [];

  F = [];

  for c_ind=1:rows(c)
    enumer_accum = [];
    denom_accum = [];
    for p_ind=1:rows(x)
      enumer_accum(p_ind) = u(c_ind,p_ind) * (x(p_ind)  - c(c_ind)) * ((x(p_ind)  - c(c_ind))');
    end
    numerator = sum(enumer_accum);
    denominator = sum(u(c_ind, :));
    F(c_ind) = numerator/denominator;
  end

  fuzzy_hyper_volume_buff = [];
  for i = 1:columns(F)
    ev = @(fi) sqrt(det(fi));
    fuzzy_hyper_volume_buff(i) = ev(F(i));
  end

  fuzzy_hyper_volume = sum(fuzzy_hyper_volume_buff);
  result = {
    fhv = fuzzy_hyper_volume
  };
endfunction
